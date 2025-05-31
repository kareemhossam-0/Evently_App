import 'package:evently_app/core/extentions/date_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/data/DM/category_dm.dart';
import '../../core/data/DM/event_dm.dart';
import '../../core/data/DM/userDM.dart';
import '../../core/data/firebase_services/firebase_services.dart';
import '../../core/resourses/colors_manager.dart';
import '../../core/resourses/constant_manager.dart';
import '../../core/resourses/validation_rules.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_tab_bar.dart';
import '../../core/widgets/custom_text_botton.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../l10n/app_localizations.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  late TextEditingController titleController;

  late TextEditingController descriptionController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  CategoryDM selectedCategory = ConstantManager.categoriesWithoutAll[0];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.create_event,
        ),
      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(selectedCategory.imagePath)),
                CustomTabBar(
                  onCategoryTabClicked: _onCategoryItemClicked,
                  categories: ConstantManager.categoriesWithoutAll,
                  selectedTabBg: ColorsManager.blue,
                  unselectedTabBg: Colors.transparent,
                  selectedLabelColor: ColorsManager.light,
                  unselectedLabelColor: ColorsManager.blue,
                  verticalPadding: 16,
                ),
                Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextFormField(
                    validator: (input) {
                      if (!ValidateEvent.isValidTitle(input)) {
                        return ValidateEvent.enterTitleMessage;
                      }
                      return null;
                    },
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    labelText: AppLocalizations.of(context)!.event_title,
                    prefixIcon: Icons.edit_note_outlined),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  AppLocalizations.of(context)!.description,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextFormField(
                  validator: (input) {
                    if (!ValidateEvent.isExistingDescription(input)) {
                      return ValidateEvent.enterDescMessage;
                    }
                    if (!ValidateEvent.descriptionLengthGreaterThan5(input)) {
                      return ValidateEvent.inputLessThen6;
                    }
                  },
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  labelText: AppLocalizations.of(context)!.event_description,
                ),
                Row(
                  children: [
                    const Icon(Icons.date_range),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: Text(
                          selectedDate.toFormattedDate,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall,
                        )),
                    CustomTextButton(
                        title: AppLocalizations.of(context)!.choose_date,
                        onPress: _showEventDate)
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: Text(
                          selectedDate.getTime,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall,
                        )),
                    CustomTextButton(
                        title: AppLocalizations.of(context)!.choose_time,
                        onPress: _showEventTime),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomElevatedButton(
                    title: AppLocalizations.of(context)!.add_event,
                    onPress: _createEvent)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCategoryItemClicked(CategoryDM category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void _createEvent() async {
    /// check form fields valid or not valid
    /// ref -> tiltle, desc\
    if (!formKey.currentState!.validate()) return;
    try {
      EventDM event = EventDM(
          uid: UserDM.currentUSer!.id,
          category: selectedCategory,
          title: titleController.text,
          description: descriptionController.text,
          dateTime: selectedDate.copyWith(
              hour: selectedTime.hour, minute: selectedTime.minute));
      await FirebaseServices.addEventToFireStore(event);
      Navigator.pop(context);
    } catch (exception) {
      print(exception.toString());
    }
  }

  void _showEventDate() async {
    selectedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 356))) ??
        selectedDate;
    setState(() {});
  }

  void _showEventTime() async {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
            selectedTime;
    selectedDate = selectedDate.copyWith(
        hour: selectedTime.hour, minute: selectedTime.minute);
    setState(() {});
  }
}


