class TodoEntry {
  TodoEntry(
      {required this.checked, required this.title, required this.description, required this.uid});
  bool checked;
  String title;
  String description;
  String uid;

  Map<String, dynamic> createMap() {
    return {"checked": checked, "title": title, "description": description, "uid": uid};
  }

  TodoEntry.fromFirestore(Map<String, dynamic> firestoreMap)
      : checked = firestoreMap["checked"],
        title = firestoreMap["title"],
        description = firestoreMap["description"],
        uid = firestoreMap["uid"];
}
