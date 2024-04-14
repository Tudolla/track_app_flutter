import 'package:expense_track/widgets/expenses_list/expenses_list.dart';
import 'package:expense_track/models/expense.dart';
import 'package:expense_track/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdExpenses = [
    Expense(
        title: 'SpringBoot',
        ammount: 22.2,
        date: DateTime.now(),
        category: Category.asus),
    Expense(
        title: 'Django',
        ammount: 28.2,
        date: DateTime.now(),
        category: Category.hp),
    Expense(
        title: 'SQL',
        ammount: 82.2,
        date: DateTime.now(),
        category: Category.dell),
  ];

  void _openAddTrackerDialog() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addNew,
      ),
    );
  }

  void _addNew(Expense expense) {
    setState(() {
      _registerdExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final indexRemove = _registerdExpenses.indexOf(expense);
    setState(() {
      _registerdExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        duration: Duration(seconds: 2),
        content: Text('Pham Kieu Van kiss Tu'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registerdExpenses.insert(indexRemove, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainBoard = const Center(
      child: Text('Nothing here!'),
    );

    if (_registerdExpenses.isNotEmpty) {
      mainBoard = ExpensesList(
        expenses: _registerdExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking App"),
        actions: [
          IconButton(
            onPressed: _openAddTrackerDialog,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            child: mainBoard,
          ),
        ],
      ),
    );
    // TODO: implement build
  }
}
