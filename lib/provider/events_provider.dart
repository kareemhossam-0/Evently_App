import 'package:flutter/cupertino.dart';

import '../core/data/DM/category_dm.dart';
import '../core/data/DM/event_dm.dart';
import '../core/data/firebase_services/firebase_services.dart';
import '../core/resourses/constant_manager.dart';

class EventsProvider extends ChangeNotifier {
  CategoryDM selectedCategory = ConstantManager.categories[0];
  List<EventDM> events = [];

  getEvents() async {
    print(selectedCategory.categoryName);
    events = await FirebaseServices.getEventsOneTimeRead(selectedCategory);

    notifyListeners();
  }
}
