import 'package:get/get.dart';

class PersonalInfoHelper {
  String goalDropDownTitle = 'Goal for activation';
  String incomeDropDownTitle = 'Monthly Income';
  String expenseDropDownTitle = 'Monthly Expense';

  List<String> goalOptions = ['Goal 1', 'Goal 2', 'Goal 3', 'Goal 4'];
  List<String> incomeOptions = [
    'Income option 1',
    'Income option 2',
    'Income option 3',
    'Income option 4'
  ];
  List<String> expenseOptions = [
    'Expense option 1',
    'Expense option 2',
    'Expense option 3',
    'Expense option 4'
  ];

  RxString selectedGoal = RxString('');
  RxString selectedIncome = RxString('');
  RxString selectedExpense = RxString('');

  void onGoalSelected(String? string) {
    selectedGoal.value = string ?? '';
  }

  void onIncomeSelected(String? string) {
    selectedIncome.value = string ?? '';
  }

  void onExpenseSelected(String? string) {
    selectedExpense.value = string ?? '';
  }

  bool isPersonalInfoScreenValid() {
    return selectedGoal.value.isNotEmpty &&
        selectedIncome.value.isNotEmpty &&
        selectedExpense.value.isNotEmpty;
  }
}
