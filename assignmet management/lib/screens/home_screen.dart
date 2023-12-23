import 'package:assignment_list/helpers/drawer_navigation.dart';
import 'package:assignment_list/screens/todo_screen.dart';
import 'package:assignment_list/services/notes_service.dart';
import 'package:flutter/material.dart';

import '../models/notes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _noteService = noteService();
  List<Note> _noteList = <Note>[];

  @override
  initState() {
    super.initState();
    getAllNotes();
  }

  getAllNotes() async {
    _noteService = noteService();
    _noteList = <Note>[];

    var notes = await _noteService.readNotes();

    notes.forEach((note) {
      setState(() {
        var model = Note();
        model.id = note['id'];
        model.title = note['title'];
        model.description = note['description'];
        model.category = note['category'];
        model.todoDate = note['todoDate'];
        model.isFinished = note['isFinished'];
        _noteList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 128, 142, 175),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 10, 56),
        title: Text('Academic Notes'),
      ),
      drawer: DrawerNavigaton(),
      body: ListView.builder(
          itemCount: _noteList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90)),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _noteList[index].title ?? 'No Title',
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 27, 45),
                          fontWeight: FontWeight.w800, // light
                          //  fontStyle: FontStyle., // italic
                        ),
                      )
                    ],
                  ),
                  subtitle: Text(_noteList[index].category ?? 'No Category'),
                  trailing: Text(_noteList[index].todoDate ?? 'No Date'),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TodoScreen())),
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(246, 9, 49, 27),
      ),
    );
  }
}
