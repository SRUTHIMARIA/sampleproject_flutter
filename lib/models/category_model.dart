import 'package:flutter_template/gen/assets.gen.dart';

class CategoryModel {
  String category;
  String image;


  CategoryModel({
    required this.category,
    required this.image,

  });
}

List<CategoryModel> categoryDetails = [

  CategoryModel(
    category: 'Who am I',
    image:'assets/icons/icon_whoamI.svg',

  ),
  CategoryModel(
    category: 'Aspirations',
    image:'assets/icons/icon_aspiration.svg',

  ),
  CategoryModel(
    category: 'Self  evaluation\nquiz',
    image:'assets/icons/icon_selfanaysis.svg',

  ),
  CategoryModel(
    category: 'Skill development \nplan',
    image:'assets/icons/icon_skill.svg',

  ),
  CategoryModel(
    category: 'Physical goal',
    image:'assets/icons/icon_physicalgoal.svg',

  ),
  CategoryModel(
    category: 'Mindset goal ',
    image:'assets/icons/icon_mindset.svg',

  ),
  CategoryModel(
    category: 'Weekly planner',
    image:'assets/icons/icon_weekly.svg',

  ),
  CategoryModel(
    category: 'Daily reflection',
    image:'assets/icons/icon_daily.svg',

  ),
  CategoryModel(
    category: 'Self analysis',
    image:'assets/icons/icon_selfanaysis.svg',

  ),
  CategoryModel(
    category: 'Self analysis\nnotes',
    image:'assets/icons/icon_notes.svg',

  ),
  CategoryModel(
    category: 'Weekly review',
    image:'assets/icons/icon_weekly.svg',

  ),
  CategoryModel(
    category: 'Monthly review',
    image:'assets/icons/icon_monthly.svg',

  ),
  CategoryModel(
    category: 'Current mindset',
    image:'assets/icons/icon_current.svg',

  ),


];