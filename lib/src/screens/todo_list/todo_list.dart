import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/src/models/todo_entry.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList(
      {Key? key,
      required this.entryStream,
      required this.removeEntry,
      required this.getUser})
      : super(key: key);
  Stream<QuerySnapshot> entryStream;
  void Function(TodoEntry entry, String uid) removeEntry;
  final User? Function() getUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: entryStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("unable to load data");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading ...");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return SingleTodoEntry(
              entry: TodoEntry(
                  checked: data["checked"],
                  title: data["title"],
                  description: data["description"],
                  uid: data["uid"]),
              getUser: getUser,
              removeEntry: removeEntry,
            );
          }).toList(),
        );
      },
    );
  }
}

class SingleTodoEntry extends StatefulWidget {
  SingleTodoEntry(
      {Key? key,
      required this.entry,
      required this.getUser,
      required this.removeEntry})
      : super(key: key);
  TodoEntry entry;
  void Function(TodoEntry entry, String uid) removeEntry;
  final User? Function() getUser;

  @override
  State<SingleTodoEntry> createState() => _SingleTodoEntryState();
}

class _SingleTodoEntryState extends State<SingleTodoEntry> {
  @override
  Widget build(BuildContext context) {
    Timer _timer;
    return Container(
        child: Row(
      children: [
        //* Remove entry when ticked
        Checkbox(
            value: widget.entry.checked,
            onChanged: (bool? value) {
              setState(() {
                widget.entry.checked = value!;
                _timer = new Timer(const Duration(milliseconds: 400), ()=>widget.removeEntry(
                  widget.entry, widget.getUser()!.uid.toString())); 
                
              });
            }),
        Text(widget.entry.title)
      ],
    ));
  }
}
