import 'package:flutter/material.dart';

// @required is defined in the meta.dart package
import 'package:meta/meta.dart';
import 'package:task_02_category_widget/unit.dart';

class Category {

  // ColorSwatch extends Color
  // This is useful if a screen has to use same pallete of colors
  // for different items like appbar, cards, button background
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;
  final String name;


  // While the @required checks for whether a named parameter is passed in,
  // it doesn't check whether the object passed in is null. We check that
  // in the assert statement.
  const Category(
      {@required this.name,
      @required this.color,
      @required this.iconLocation,
      @required this.units})
      : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null);
}
