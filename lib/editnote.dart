import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notesapp/entities/savenote.dart';


class EditNote extends StatefulWidget {
  const EditNote({Key? key, required this.title, required this.body,required this.id}) : super(key: key);
  final String title;
  final String body;
  final int id;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late TextEditingController titleController ;
  late TextEditingController bodyController ;

  @override
  void initState(){
    super.initState();
    titleController = TextEditingController(text: widget.title);
    bodyController = TextEditingController(text: widget.body );

  }


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
              updateNote(titleController.text, bodyController.text,widget.id);
              Navigator.of(context).pop();
            },
          )
        ],
        title: Text('Edit Note'),
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
updateNote(String title,String content,int id) {
  final isar = Isar.getInstance('superinstance');
  final note = SaveNote()
    ..id= id
    ..content = content
    ..title=title
  ..datetime=DateTime.now();
  isar?.writeTxnSync(() {
    isar.saveNotes.putSync(note);
  });}

}