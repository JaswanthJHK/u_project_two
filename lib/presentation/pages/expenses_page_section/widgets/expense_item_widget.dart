import 'package:flutter/material.dart';
import 'package:udemy_expense_tracker/model/expense_model.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/screens/expenses.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  '\u20B9 ${expense.amount.toStringAsFixed(2)}',
                ), // here the toStringAsFixed show only two digits after point value
                // like 12.34 instead of 12.345444
                const Spacer(),

                Row(
                  children: [
                     Icon(catogoryIcons[expense.catogory]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
