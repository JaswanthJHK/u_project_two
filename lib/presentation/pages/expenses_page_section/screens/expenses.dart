import 'package:flutter/material.dart';
import 'package:udemy_expense_tracker/model/expense_model.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/screens/dummy.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/widgets/chart/chart.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/widgets/expense_bottom_sheet.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/widgets/expenses_list_widget.dart';

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

      builder: (ctx) => SingleChildScrollView(
        child: ExpenseBottomSheet(
          onAddExpense: _addExpense,
        ),
      ),
    );
  }

  void _addExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(ExpenseModel expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = Center(
      child: Text(
        "No expenses found.\n Start adding some!",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey[500],
        ),
      ),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        removeList: _removeExpense,
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Expense Tracker",
            // style: TextStyle(
            //     fontSize: 30,
            //     fontWeight: FontWeight.w700,
            //     color: Colors.grey[800]
            // ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DummyScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.next_plan,
              ),
            )
          ],
        ),
        body: width <
                600 //  checking the screen size and making the difference according the screen size
            ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(child: mainContent),
                  FloatingActionButton(
                    onPressed: _openAddExpenseOverlay,
                    // backgroundColor: Colors.grey[400],
                    child: Icon(
                      Icons.add,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(child: mainContent),
                  FloatingActionButton(
                    onPressed: _openAddExpenseOverlay,
                    // backgroundColor: Colors.grey[400],
                    child: Icon(
                      Icons.add,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ));
  }
}
