import 'package:flutter/material.dart';
import 'package:udemy_expense_tracker/main.dart';
import 'package:udemy_expense_tracker/model/expense_model.dart';

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
      amount: 499,
      date: DateTime.now(),
      catogory: Catogory.work,
    ),
    // ExpenseModel(
    //   title: "Flutter Course",
    //   amount: 299,
    //   date: DateTime.now(),
    //   catogory: Catogory.leisure,
    // ),

  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("blablaaa"),
          Text("expensess......."),
        ],
      ),
    );
  }
}
