import 'dart:math';

import 'package:first_app/src/models/todo_entry.dart';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class Database extends ChangeNotifier{

  final List<TodoEntry> _entries = List.empty(growable: true);

  List<TodoEntry> get getEntries => _entries;

  void addEntry(TodoEntry entry, String uid){
    _entries.add(entry);
    saveEntries(uid);
  }

  void removeEntry(TodoEntry entry, String uid){
    _entries.remove(entry);
    _removeItem(entry.uid, uid);
  }

  FirebaseFirestore _db = FirebaseFirestore.instance;
  
  saveEntries(String uid) {
    for(TodoEntry entry in _entries){
      _saveEntries(entry, uid);
    } 
  }

  Future<void> _saveEntries(TodoEntry entry, String uid) {
    return _db.collection("data").doc(uid).collection("tasks").doc(entry.uid).set(entry.createMap());
  }

  Stream<List<TodoEntry>> getEntriesFromDatabase(String uid) {
    return _db.collection("data").doc(uid).collection("tasks").snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => TodoEntry.fromFirestore(document.data()))
        .toList());
  }

  Future<void> _removeItem(String entryUid, String userUid) {
    return _db.collection("data").doc(userUid).collection("tasks").doc(entryUid).delete();
  }

  // Future<List<TodoEntry>> getData(String uid) async{
  //   List<TodoEntry> entries = List.empty(growable: true);
  //   CollectionReference collectionReference = FirebaseFirestore.instance.collection("data").doc(uid).collection("tasks");
  //   collectionReference.snapshots().listen((snapshot){
  //     for(var entry in snapshot.docs){
  //       entries.add(TodoEntry.fromFirestore(entry.data() as Map<String, dynamic>));
  //     }
  //   });
  //   return entries;
  // }

  Stream<QuerySnapshot> getDataStream(String uid){
    return FirebaseFirestore.instance.collection("data").doc(uid).collection("tasks").snapshots();
  }
  
}