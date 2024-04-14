import 'package:expense_track/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // var enterValue ='';
  // void _saveTitle(String inputValue){
  //   enterValue=inputValue;
  // }
  final _titileController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.asus;

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;

    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titileController.dispose();
    _amountController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _submitData() {
    final inputAmount = double.tryParse(_amountController.text);
    final amountisValid = inputAmount == null || inputAmount <= 0;

    if (_titileController.text.trim().isEmpty ||
        amountisValid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Invalid"),
          content: const Text('Please fill all data'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Good'),
            ),
          ],
        ),
      );
      return;
    }
    // save data function
    widget.onAddExpense(
      Expense(
          title: _titileController.text,
          ammount: inputAmount,
          date: _selectedDate!,
          category: _selectedCategory),
       
    );
  Navigator.pop(context); 
  
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 5, 15),
      child: Column(
        children: [
          TextField(
            controller: _titileController,
            maxLength: 20,
            decoration:const InputDecoration(
              label: Text('Title?'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount?'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'No date selected!'
                      : formatter.format(_selectedDate!)),
                  IconButton(
                    onPressed: _showDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
