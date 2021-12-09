// a function which will return the list of caterogries model

import 'package:flutterpackage/Models/categoriesModel.dart';

String apiKey = '563492ad6f917000010000010001b0e3eb0f41088b2431e1d8677a64';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = [];
  CategoriesModel categoriesModel = CategoriesModel();

  categoriesModel.imageURL =
      'https://images.pexels.com/photos/705675/pexels-photo-705675.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  categoriesModel.categoriesName = 'Laptops';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imageURL =
      'https://images.pexels.com/photos/1149831/pexels-photo-1149831.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  categoriesModel.categoriesName = 'Cars';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imageURL =
      'https://images.pexels.com/photos/705675/pexels-photo-705675.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  categoriesModel.categoriesName = 'Bikes';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imageURL =
      'https://images.pexels.com/photos/705675/pexels-photo-705675.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  categoriesModel.categoriesName = 'Animals';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imageURL =
      'https://images.pexels.com/photos/4271683/pexels-photo-4271683.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260';
  categoriesModel.categoriesName = 'Nature';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imageURL =
      'https://images.pexels.com/photos/705675/pexels-photo-705675.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  categoriesModel.categoriesName = 'Wild Life';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  return categories;
}
