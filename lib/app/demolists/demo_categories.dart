import 'package:foodhub/app/models/category_model_class.dart';

class DemoCategoryList {
  static final List<CategoryModelClass> categorieslist = [
    CategoryModelClass(category: 'Main Course', parentCategory: '-'),
    CategoryModelClass(category: 'Fast Food', parentCategory: '-'),
    CategoryModelClass(category: 'Healthy', parentCategory: '-'),
    CategoryModelClass(category: 'Desserts', parentCategory: '-'),
    CategoryModelClass(category: 'Beverages', parentCategory: '-'),
    CategoryModelClass(category: 'Snacks', parentCategory: 'Healthy'),
    CategoryModelClass(category: 'Breakfast', parentCategory: '-'),
    CategoryModelClass(category: 'Asian', parentCategory: 'Healthy'),
    CategoryModelClass(category: 'BBQ', parentCategory: '-'),
    CategoryModelClass(category: 'Salads', parentCategory: '-'),
    CategoryModelClass(category: 'Soups', parentCategory: 'Healthy'),
    CategoryModelClass(category: 'Italian', parentCategory: '-'),
    CategoryModelClass(category: 'Sandwiches', parentCategory: '-'),
    CategoryModelClass(category: 'Pakistani', parentCategory: '-'),
    CategoryModelClass(category: 'Indians', parentCategory: '-'),
    CategoryModelClass(category: 'Bengali', parentCategory: '-'),
    CategoryModelClass(category: 'Sweets', parentCategory: '-'),
  ];
}
