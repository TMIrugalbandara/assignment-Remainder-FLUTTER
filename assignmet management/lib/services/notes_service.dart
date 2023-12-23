import 'package:assignment_list/repositories/repository.dart';
import 'package:flutter/foundation.dart';

import '../models/notes.dart';

class noteService{
  Repository ?_repository;

  noteService(){
    _repository=Repository();
  }

  saveNotes(Note note)async{
    return await _repository?.insertData('todos', note.todoMap());
  }
  readNotes() async{
    return await _repository?.readData('todos');
  }

  readNotesByCategory(category)async{
    return await _repository?.readDataByColumName('todos', 'category', category);
  }
}