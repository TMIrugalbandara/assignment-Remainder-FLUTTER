import 'package:assignment_list/models/notes.dart';
import 'package:assignment_list/services/notes_service.dart';
import 'package:flutter/material.dart';

class NotesByCategory extends StatefulWidget {
  //const NotesByCategory({super.key});
  final String category;
  NotesByCategory({required this.category});

  @override
  State<NotesByCategory> createState() => _NotesByCategoryState();
}

class _NotesByCategoryState extends State<NotesByCategory> {
  List<Note> _noteList = <Note>[];
  noteService _noteService = noteService();

  @override
  void initState() {
    super.initState();
    getNotesByCategories();
  }

  getNotesByCategories() async {
    var notes = await _noteService.readNotesByCategory(this.widget.category);
    notes.forEach((note) {
      setState(() {
        var model = Note();
        model.title = note['title'];
        model.description = note['description'];
        model.todoDate = note['todoDate'];

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
        title: Text('Academic Notes by Type'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _noteList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90)),
                        elevation: 8,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text(_noteList[index].title)],
                          ),
                          subtitle: Text(_noteList[index].description),
                          trailing: Text(_noteList[index].todoDate),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
