import 'package:flutter/material.dart';

// @required is defined in the meta.dart package
import 'package:meta/meta.dart';
import 'package:task_02_category_widget/unit.dart';
import 'package:task_02_category_widget/converter_route.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color; // ColorSwatch extends Color
  final IconData iconLocation;
  final List<Unit> units;

  // While the @required checks for whether a named parameter is passed in,
  // it doesn't check whether the object passed in is null. We check that
  // in the assert statement.
  const Category(
      {Key key,
      @required this.name,
      @required this.color,
      @required this.iconLocation,
      @required this.units})
      : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);

  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.

  Widget build(BuildContext context) {
    // Material because inkwell's one of the parents must be material
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          onTap: () {
            print('Tapped');
            _navigateToConverter(context);
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    iconLocation,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text(
            name,
            style: Theme.of(context).textTheme.display1,
          ),
          centerTitle: true,
          backgroundColor: color[100],
        ),
        body: ConverterRoute(name: name, units: units, color: color),
      );
    }));
  }
}
