import 'package:flutter/material.dart';
import 'package:task_02_category_widget/category_route.dart';

const _categoryName = 'Cake';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.green;

/// The function that is called when main.dart is run.
void main() {
  runApp(UnitConverterApp());
}

/// This widget is the root of our application.
/// Currently, we just show one widget in our app.
class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Unit Converter',
        theme: ThemeData(
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.black, displayColor: Colors.grey[600]),
          // This colors the [InputOutlineBorder] when it is selected
          primaryColor: Colors.grey[500],
          textSelectionHandleColor: Colors.green[500],
        ),
        home: CategoryRoute());
  }
}
