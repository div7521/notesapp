import 'package:flutter/material.dart';
import 'package:notesapp/appstyle.dart';
import 'package:notesapp/createnote.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/editnote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final noteslist= List.of(readSaveNote(searchController.text).reversed);
    return Scaffold(
      backgroundColor: Appstyle.mainColor,
      appBar: AppBar(
        backgroundColor: Appstyle.accentColor,
        title: const Center(
          child: Text(
            'Notes',
            style: TextStyle(fontSize: 40),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu, size: 40),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15.0,
            ),
            TextField(
              controller: searchController,
              onChanged: (data) {
                setState(() {});
              },
              onTapOutside: (event){
                FocusManager.instance.primaryFocus?.unfocus();
              },
              style: const TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  fillColor: Colors.grey[800],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent))),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: noteslist.length,
                  itemBuilder: (context, index) {
                    DateTime timestamp = noteslist[index].datetime;
                    String then =
                        '${timestamp.day}/${timestamp.month}/${timestamp.day}  ${timestamp.hour}:${timestamp.minute}:${timestamp.second}';

                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) =>  EditNote(title: noteslist[index].title, body: noteslist[index].content,id: noteslist[index].id)))
                            .then((value) => setState(() {}));
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(noteslist[index].title),
                            Text(noteslist[index].content),
                            Text(then),
                          ],
                        ),
                      ),
                    );
                  }),
            ),

            // ListView.builder(
            //   itemCount:,
            //   itemBuilder:(context, index){
            //     return Card(
            //       child: Padding(
            //         padding:const EdgeInsets.all(10),
            //         child:Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children:[
            //             Text("titleController.text"),
            //
            //
            //
            //
            //             )
            //           ]
            //         )
            //       )
            //     )
            //   }
            //
            //
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const CreateNote()))
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
