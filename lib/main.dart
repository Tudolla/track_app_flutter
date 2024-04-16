import 'package:expense_track/widgets/expenses.dart';
import 'package:flutter/material.dart';

var aColorScheme = ColorScheme.fromSeed(seedColor:Color.fromARGB(222, 29, 160, 127),);
var darkColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 29, 31, 31),);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    darkTheme: ThemeData.dark().copyWith(
      colorScheme: darkColorScheme,

    ),
     
    
    theme: ThemeData().copyWith(
      colorScheme: aColorScheme,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: aColorScheme.onPrimaryContainer,
        foregroundColor: aColorScheme.onPrimaryContainer,
      ),
      cardTheme: CardTheme().copyWith(
        color: aColorScheme.secondaryContainer,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: aColorScheme.primaryContainer,
        ),
      ) ,
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,color: aColorScheme.onSecondaryContainer,
        )
      ),
      
      
    ),
    // themeMode: ThemeMode.system,
    home: Expenses(),
  ));
}
