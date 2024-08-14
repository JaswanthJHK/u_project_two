import 'package:flutter/material.dart';
import 'package:udemy_expense_tracker/model/expense_model.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/widgets/expense_item_widget.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeList});

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) removeList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          margin: Theme.of(context).cardTheme.margin,
          color: Theme.of(context).colorScheme.error.withOpacity(0.6),
          child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 350),
              child:
                  //  Text(
                  //   "Deleting...",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 20,
                  //   ),
                  //   textAlign: TextAlign.end,
                  // ),
                  Icon(
                Icons.delete_outline_rounded,
                size: 35,
                color: Colors.grey[800],
              )),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          removeList(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
