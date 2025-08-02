import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_to_do/models/to_do_model.dart';
import 'package:provider_to_do/provider/to_do_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _textTEController = TextEditingController();

  void _showDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add to do list'),
          content: TextField(
            controller: _textTEController,
            decoration: InputDecoration(hintText: 'Write to do item'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_textTEController.text.isEmpty) {
                  return;
                }
                context.read<ToDoProvider>().addToDoList(
                  ToDoModel(title: _textTEController.text, isCompleted: false),
                );
                _textTEController.clear();
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDoProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('To do list'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  'To do list',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: ListView.builder(
                itemCount: provider.allToDoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      provider.toDoStatusChange(provider.allToDoList[index]);
                    },
                    title: Text(
                      provider.allToDoList[index].title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        decoration: provider.allToDoList[index].isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    leading: Checkbox(
                      value: provider.allToDoList[index].isCompleted,
                      onChanged: (selected) {
                        provider.toDoStatusChange(provider.allToDoList[index]);
                      },
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        provider.removeToDoList(provider.allToDoList[index]);
                      },
                      icon: Icon(Icons.delete,color: Colors.red,),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
