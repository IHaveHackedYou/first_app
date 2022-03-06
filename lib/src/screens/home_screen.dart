import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/src/consts/custom_app_bar.dart';
import 'package:first_app/src/models/todo_entry.dart';
import 'package:first_app/src/screens/todo_list/add_todo.dart';
import 'package:first_app/src/screens/todo_list/todo_list.dart';
import 'package:first_app/src/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(
      {Key? key,
      required this.signOut,
      required this.getUser,
      required this.startAddingTask})
      : super(key: key);

  final void Function() signOut;
  final User? Function() getUser;
  final void Function() startAddingTask;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //List<TodoEntry> _entries = List.empty(growable: true);
    
    
    final databaseProvider = Provider.of<Database>(context, listen: false);
    final Stream<QuerySnapshot> _entryStream = databaseProvider.getDataStream(widget.getUser()!.uid.toString());
      // databaseProvider.getEntriesFromDatabase(widget.getUser()!.uid.toString());
      //_entries = await databaseProvider.getData(widget.getUser()!.uid.toString());
      //print(_entries);
    //loadList();
    return Scaffold(
      //appBar: CustomAppBars.mainAppBar(context),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 30),
          onPressed: () {
            widget.startAddingTask();
          }),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text("Tasks", style: TextStyle(fontSize: 25)),
                    )),
                Container(
                    padding: EdgeInsets.only(top: 20, right: 20),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            child: Icon(Icons.logout), onTap: widget.signOut)))
              ],
            ),
            Divider(
              thickness: 2,
            ),
            Container(height: 200, child: TodoList(entryStream: _entryStream, removeEntry: databaseProvider.removeEntry, getUser: widget.getUser,))
          ],
        ),
      ),
    );
    //floatingActionButton: FloatingActionButton(onPressed: widget.signOut),
  }
}
