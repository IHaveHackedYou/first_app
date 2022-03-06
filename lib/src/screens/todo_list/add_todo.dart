import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/src/consts/input_forms.dart';
import 'package:first_app/src/models/todo_entry.dart';
import 'package:first_app/src/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key, required this.getUser, required this.backToMainPage})
      : super(key: key);
  final User? Function() getUser;
  final Function() backToMainPage;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          children: [
            Expanded(
                child: Container(
                    padding: EdgeInsets.only(left: 50),
                    child: GestureDetector(
                      child: Text("Cancel"),
                      onTap: widget.backToMainPage,
                    ))),
            FloatingActionButton(
                child: Icon(Icons.add, size: 30),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final databaseProvider =
                          Provider.of<Database>(context, listen: false);
                      databaseProvider.addEntry(
                          TodoEntry(
                              checked: false,
                              title: titleController.text,
                              description: descriptionController.text,
                              uid: DateTime.now().toString()),
                          widget.getUser()!.uid.toString());
                      widget.backToMainPage();
                    } catch (e) {
                      // TODO add errors
                    }
                  }
                }),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text("Add Task", style: TextStyle(fontSize: 25)),
                  )),
              Divider(
                thickness: 2,
              ),
              Container(
                  height: 200,
                  child: Form(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: titleController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter a title";
                                      }
                                      return null;
                                    },
                                    decoration:
                                        InputDecorations.normalInputField(
                                            "title", context),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: descriptionController,
                                    decoration:
                                        InputDecorations.normalInputField(
                                            "description", context),
                                  )
                                ],
                              ))),
                      key: _formKey))
            ],
          ),
        ));
  }
}
