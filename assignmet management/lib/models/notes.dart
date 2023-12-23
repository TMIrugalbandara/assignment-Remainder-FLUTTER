class Note{
  int ? id;
 late String title;
  late String description;
  late String category;
  late String todoDate;
  late int isFinished;

  todoMap(){
    var mapping =Map<String,dynamic>();
    mapping['id']=id;
    mapping['title']=title;
    mapping['description']=description;
    mapping['category']=category;
    mapping['todoDate']=todoDate;
    mapping['isFinished']=isFinished;

    return mapping;
  }
}