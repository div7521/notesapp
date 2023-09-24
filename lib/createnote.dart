import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notesapp/entities/savenote.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save, size: 40),
            onPressed: () {
              if (titleController.text.isEmpty) {
                return;
              }
              if (bodyController.text.isEmpty) {
                return;
              }
              addSaveNote(titleController.text, bodyController.text);
              Navigator.of(context).pop();
            },
          )
        ],
        title: const Text('New Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextFormField(
                controller: bodyController,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Body'))
          ],
        ),
      ),
    );
  }
}

addSaveNote(String title, String content) {
  final isar = Isar.getInstance('superinstance');
  final note = SaveNote()
    ..content = content
    ..title = title
    ..datetime = DateTime.now();
  isar?.writeTxnSync(() {
    isar.saveNotes.putSync(note);
  });
}

List<Note> readSaveNote(String search) {
  final isar = Isar.getInstance('superinstance');
  var listofnotes = <Note>[];
  final notesfromisar =
      isar?.saveNotes.filter().contentContains(search).or().titleContains(search).findAllSync();
  if (notesfromisar == null || notesfromisar.isEmpty) {
    return listofnotes;
  }
  for(final item in notesfromisar){
    listofnotes.add(
      Note(id: item.id, title: item.title, content: item.content, datetime: item.datetime)
    );
  }
  return listofnotes;
}

