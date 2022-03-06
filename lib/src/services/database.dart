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

  Stream<List<TodoEntry>> getProducts(String uid) {
    return _db.collection("data").doc(uid).collection("tasks").snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => TodoEntry.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeItem(TodoEntry entry, String uid) {
    return _db.collection("data").doc(uid).collection("tasks").doc(entry.uid).delete();
  }
}