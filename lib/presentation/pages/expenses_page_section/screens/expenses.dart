import 'package:flutter/material.dart';
import 'package:udemy_expense_tracker/model/expense_model.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/widgets/expense_bottom_sheet.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/widgets/expense_item_widget.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/widgets/expenses_list_widget.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/widgets/expense_bottom_sheet.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _registeredExpenses = [];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      //  isScrollControlled: true,

      builder: (ctx) => ExpenseBottomSheet(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
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
          Expanded(child: ExpensesList(expenses: _registeredExpenses,removeList: _removeExpense,)),
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
