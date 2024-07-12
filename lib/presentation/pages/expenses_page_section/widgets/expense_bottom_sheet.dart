import 'package:flutter/material.dart';
import 'package:udemy_expense_tracker/model/expense_model.dart';

class ExpenseBottomSheet extends StatefulWidget {
  const ExpenseBottomSheet({super.key});

  @override
  State<ExpenseBottomSheet> createState() => _ExpenseBottomSheetState();
}

class _ExpenseBottomSheetState extends State<ExpenseBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Catogory _selectedCatogory = Catogory.leisure;

  _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseDataForm() {
    final enterdAmount = double.parse(_amountController.text);
    if(_titleController.text.trim().isEmpty){

    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 40,
            decoration: const InputDecoration(label: Text("Expense Title")),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: const InputDecoration(
                    label: Text("Expense Amount"),
                    prefixText: "\u20B9 ",
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Select Date"
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month_outlined))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCatogory,
                items: Catogory.values
                    .map(
                      (catogory) => DropdownMenuItem(
                        value: catogory,
                        child: Text(
                          catogory.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCatogory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                  onPressed: _submitExpenseDataForm,
                  child: const Text("Save Expense"))
            ],
          )
        ],
      ),
    );
  }
}
