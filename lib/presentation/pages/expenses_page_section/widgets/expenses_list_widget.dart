import 'package:flutter/material.dart';
import 'package:udemy_expense_tracker/model/expense_model.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/widgets/expense_item_widget.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expenses[index]),);
  }
}
