import 'package:evently_app/core/extentions/text_ex.dart';

class ValidateEvent {
  static String enterTitleMessage = "Plz, enter title";
  static String enterDescMessage = "Plz, enter description";
  static String inputLessThen6 = "Sorry, desc should be at least 6 chars";

  static bool isValidTitle(String? title) {
    return title != null && title.isNotEmpty;
  }

  static bool isExistingDescription(String? description) {
    if (description != null && description.trim().isNotEmpty) {
      return true;
    }

    return false;
  }

  static bool descriptionLengthGreaterThan5(String? description) {
    if (description != null && description.getInputAfterTrimmed.length >= 6) {
      return true;
    }
    return false;
  }
}
