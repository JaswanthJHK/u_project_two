import 'package:flutter/material.dart';
import 'package:udemy_expense_tracker/model/expense_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) => Text("hhii"),);
  }
}
