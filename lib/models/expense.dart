import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


final formatter = DateFormat.yMd();

const uuid = Uuid();
enum Category{dell, lenovo, hp, asus, macbook}
const categoryIcons={
  Category.dell: Icons.lunch_dining,
  Category.macbook: Icons.flight,
  Category.hp: Icons.movie,
  Category.asus: Icons.work,
};
class Expense{
   Expense({
    required this.title,
   required this.ammount,
   required this.date,
   required this.category}):id= uuid.v4();
 
  final String id;
  final String title;
  final double ammount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);  
  }

 
}