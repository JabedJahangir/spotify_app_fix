import 'package:get/get.dart';

class UserSignUpController extends GetxController {
  var isChecked = false.obs;

  var selectedMonth = Rxn<String>();
  var selectedDay = Rxn<String>();
  var selectedYear = Rxn<String>();

  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  final List<String> days = List.generate(31, (index) => (index + 1).toString());

  final List<String> years = List.generate(
    76,
        (index) => (2025 - index).toString(),
  );

  void checked() {
    isChecked.value = !isChecked.value;
  }

  void selectMonth(String item) => selectedMonth.value = item;
  void selectDay(String item) => selectedDay.value = item;
  void selectYear(String item) => selectedYear.value = item;
}
