import 'package:assignment_list/models/category.dart';
import 'package:assignment_list/repositories/repository.dart';

class CategoryService{
  late Repository _repository;

  CategoryService(){
    _repository=Repository();
  }
  saveCategory(Category category) async{
return await _repository.insertData('categories', category.CategoryMap());
  }
    
readCategories() async{
  return await _repository.readData('categories');
}

readCategoryById(categoryId)async {
  return await _repository.readDataById('categories',categoryId);
}

  updateCategory(Category category)async {
    return await _repository.updateData('categories', category.CategoryMap());
  }

  deleteCategory(categoryId) async {
    return await _repository.deleteData('categories',categoryId);
  }

}