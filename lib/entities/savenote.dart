import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'savenote.g.dart';

@collection
class SaveNote {
  Id id = Isar.autoIncrement;
  late String title;
  late DateTime datetime;
  late String content;
}
class Note{
  final int id;
  final String title;
  final String content;
  final DateTime datetime;
  Note({required this.id, required this.title, required this.content, required this.datetime});
}


