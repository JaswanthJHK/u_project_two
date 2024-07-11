import 'package:flutter/material.dart';

class ExpenseBottomSheet extends StatefulWidget {
  const ExpenseBottomSheet({super.key});

  @override
  State<ExpenseBottomSheet> createState() => _ExpenseBottomSheetState();
}

class _ExpenseBottomSheetState extends State<ExpenseBottomSheet> {
  // var _enteredInput = " ";
  // void _saveTitleInput(String inputValue) {
  //   _enteredInput = inputValue;
  // }

  final TextEditingController _titleController = TextEditingController();
  final _amountController = TextEditingController();

  final now = DateTime.now();
  final firstDate = DateTime(DateTime.now().year -1,DateTime.now().month,DateTime.now().day);
  _datePicker() {
    showDatePicker(
      context: context,
      firstDate: now,
      lastDate: now,
    );
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
                    const Text("Select Date"),
                    IconButton(
                        onPressed: _datePicker,
                        icon: const Icon(Icons.calendar_month_outlined))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: const Text("Save Expense"))
            ],
          )
        ],
      ),
    );
  }
}
