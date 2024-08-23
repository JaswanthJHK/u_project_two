import 'package:flutter/material.dart';
import 'package:udemy_expense_tracker/model/expense_model.dart';

class ExpenseBottomSheet extends StatefulWidget {
  const ExpenseBottomSheet({super.key, required this.onAddExpense});
  final Function(ExpenseModel expense) onAddExpense;

  @override
  State<ExpenseBottomSheet> createState() => _ExpenseBottomSheetState();
}

class _ExpenseBottomSheetState extends State<ExpenseBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCatogory = Category.leisure;

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
    final enterdAmount = double.tryParse(_amountController.text);

    final amountIsInvalid = enterdAmount == null || enterdAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctxt) {
          return AlertDialog(
            title: const Text("Ivalid Input"),
            content: const Text(
              "Please make sure a valid Title, Amount, Date and Catogory was entered...!",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Okay"),
              ),
            ],
          );
        },
      );
      return;
    }
    widget.onAddExpense(
      ExpenseModel(
        title: _titleController.text,
        amount: enterdAmount,
        date: _selectedDate!,
        category: _selectedCatogory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final kwidth = MediaQuery.of(context).
    return LayoutBuilder(
      builder: (context, constraints) {
        //    print(constraints.minWidth);
        print(constraints.maxWidth);
        //   print(constraints.minHeight);
        print(constraints.maxHeight);
        final width = constraints.maxWidth;  //  here checking the maxwidth and rest changes are according the width changes
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (width >= 600)   //here checking the width 
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                        maxLength: 40,
                        decoration: const InputDecoration(
                            label: Text("Expense Titleee")),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _amountController,
                        decoration: const InputDecoration(
                          label: Text("Expense Amounttt"),
                          prefixText: "\u20B9 ",
                        ),
                      ),
                    ),
                  ],
                )
              else
                TextField(
                  controller: _titleController,
                  maxLength: 40,
                  decoration:
                      const InputDecoration(label: Text("Expense Title")),
                ),
              const SizedBox(
                height: 10,
              ),
              if (width >= 600)   //here checking the width 
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedCatogory,
                      items: Category.values
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

                    //====
                    const SizedBox(
                      width: 230,
                    ),
                    Row(
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
                    )
                  ],
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _amountController,
                        decoration: const InputDecoration(
                          label: Text("Expense Amount 1"),
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
              if (width >= 600)   //here checking the width 
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel?"),
                    ),
                    ElevatedButton(
                      onPressed: _submitExpenseDataForm,
                      child: const Text("Save Expense"),
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedCatogory,
                      items: Category.values
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
                      child: const Text("Cancel?"),
                    ),
                    ElevatedButton(
                      onPressed: _submitExpenseDataForm,
                      child: const Text("Save Expense"),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
