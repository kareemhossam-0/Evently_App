import 'package:evently_app/core/data/DM/category_dm.dart';

import 'assets_manager.dart';

class ConstantManager {
  static List<CategoryDM> categories = const [
    CategoryDM(
      id: "0",
      categoryName: "All",
      imagePath: ImageAssets.sports,
      iconPath: SvgAssets.all,
    ),
    CategoryDM(
      id: "1",
      categoryName: "Sports",
      imagePath: ImageAssets.sports,
      iconPath: SvgAssets.bike,
    ),
    CategoryDM(
      id: "2",
      categoryName: "Birthday",
      imagePath: ImageAssets.birthday,
      iconPath: SvgAssets.birthday,
    ),
    CategoryDM(
      id: "3",
      categoryName: "Meeting",
      imagePath: ImageAssets.meeting,
      iconPath: SvgAssets.meeting,
    ),
    CategoryDM(
      id: "4",
      categoryName: "Gaming",
      imagePath: ImageAssets.gaming,
      iconPath: SvgAssets.gaming,
    ),
    CategoryDM(
      id: "5",
      categoryName: "Eating",
      imagePath: ImageAssets.eating,
      iconPath: SvgAssets.eating,
    ),
    CategoryDM(
      id: "6",
      categoryName: "Holiday",
      imagePath: ImageAssets.holiday,
      iconPath: SvgAssets.holidays,
    ),
    CategoryDM(
      id: "7",
      categoryName: "Exhibition",
      imagePath: ImageAssets.exhibition,
      iconPath: SvgAssets.enterprise,
    ),
    CategoryDM(
      id: "8",
      categoryName: "Workshop",
      imagePath: ImageAssets.workshop,
      iconPath: SvgAssets.workshop,
    ),
    CategoryDM(
      id: "9",
      categoryName: "BookClub",
      imagePath: ImageAssets.bookClub,
      iconPath: SvgAssets.book,
    ),
  ];
}
