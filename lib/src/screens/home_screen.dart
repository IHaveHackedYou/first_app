import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/src/consts/custom_app_bar.dart';
import 'package:first_app/src/screens/todo_list/todo_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.signOut, required this.getUser}) : super(key: key);

  final void Function() signOut;
  final User? Function() getUser;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CustomAppBars.mainAppBar(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 30),
        onPressed: widget.signOut,
      ),
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
                    padding: EdgeInsets.only(top: 20, right:20),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(child: Icon(Icons.logout), onTap: widget.signOut)))
              ],
            ),
            Divider(
              thickness: 2,
            ),
            Container(
              height: 200,
              child: TodoList())
          ],
        ),
      ),
    );
    //floatingActionButton: FloatingActionButton(onPressed: widget.signOut),
  }
}
