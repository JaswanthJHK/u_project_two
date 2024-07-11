import 'package:flutter/material.dart';
import 'package:udemy_expense_tracker/model/expense_model.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/widgets/expense_bottom_sheet.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/widgets/expenses_list_widget.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
      title: "Flutter Course",
      amount: 499,
      date: DateTime.now(),
      catogory: Catogory.work,
    ),
    ExpenseModel(
      title: "Cinema",
      amount: 299,
      date: DateTime.now(),
      catogory: Catogory.leisure,
    ),
    ExpenseModel(
      title: "Trip",
      amount: 999,
      date: DateTime.now(),
      catogory: Catogory.travel,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) =>const ExpenseBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text("Expenses"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
          FloatingActionButton(
            onPressed: _openAddExpenseOverlay,
            backgroundColor: Colors.grey[400],
            child: Icon(
              Icons.add,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
