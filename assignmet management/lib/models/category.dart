class Category{
   int ? id;
  late String name;
  late String description;

  CategoryMap(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id;
    mapping['name']=name;
    mapping['description']=description;

    return mapping;
  }
}