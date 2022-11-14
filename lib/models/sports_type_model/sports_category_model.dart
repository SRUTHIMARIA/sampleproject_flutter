
class SportsCategoryModel {
  String category;
  String image;


  SportsCategoryModel({
    required this.category,
    required this.image,

  });
}

final List<SportsCategoryModel> categoryDetails = [

  SportsCategoryModel(
    category: 'Basketball',
    image:'assets/icons/icon_whoamI.svg',

  ),
  SportsCategoryModel(
    category: 'Aspirations',
    image:'assets/icons/icon_aspiration.svg',

  ),
  SportsCategoryModel(
    category: 'Self  evaluation\nquiz',
    image:'assets/icons/icon_selfanaysis.svg',

  ),
  SportsCategoryModel(
    category: 'Skill development \nplan',
    image:'assets/icons/icon_skill.svg',

  ),
  SportsCategoryModel(
    category: 'Physical goal',
    image:'assets/icons/icon_physicalgoal.svg',

  ),
  SportsCategoryModel(
    category: 'Mindset goal ',
    image:'assets/icons/icon_mindset.svg',

  ),
  SportsCategoryModel(
    category: 'Weekly planner',
    image:'assets/icons/icon_weekly.svg',

  ),
  SportsCategoryModel(
    category: 'Daily reflection',
    image:'assets/icons/icon_daily.svg',

  ),
  SportsCategoryModel(
    category: 'Self analysis',
    image:'assets/icons/icon_selfanaysis.svg',

  ),
  SportsCategoryModel(
    category: 'Self analysis\nnotes',
    image:'assets/icons/icon_notes.svg',

  ),
  SportsCategoryModel(
    category: 'Weekly review',
    image:'assets/icons/icon_weekly.svg',

  ),
  SportsCategoryModel(
    category: 'Monthly review',
    image:'assets/icons/icon_monthly.svg',

  ),
  SportsCategoryModel(
    category: 'Current mindset',
    image:'assets/icons/icon_current.svg',

  ),


];