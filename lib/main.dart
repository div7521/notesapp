import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notesapp/entities/savenote.dart';
import 'package:notesapp/homescreen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [SaveNoteSchema],
    directory: dir.path,
    name: 'superinstance',
    inspector: true
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter notes',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.indigoAccent,
      ),
           useMaterial3: true),
      home:  HomeScreen(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true,),
    );
  }
}
