import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'category.dart';
import 'unit_converter.dart';

const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryTile extends StatelessWidget {
  final Category category;
  final ValueChanged<Category> onTap;

  const CategoryTile({Key key, @required this.category, @required this.onTap})
      : assert(category != null),
        assert(onTap != null),
        super(key: key);

  /// Navigates to the [UnitConverter].
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
            category.name,
            style: Theme.of(context).textTheme.display1,
          ),
          centerTitle: true,
          backgroundColor: category.color,
        ),
        body: UnitConverter(category: category),
        resizeToAvoidBottomPadding: false,
      );
    }));
  }

  // This `context` parameter describes the location of this widget in the
// widget tree. It can be used for obtaining Theme data from the nearest
// Theme ancestor in the tree. Below, we obtain the display1 text theme.

  @override
  Widget build(BuildContext context) {
    // Material because inkwell's one of the parents must be material
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: category.color['highlight'],
          splashColor: category.color['splash'],
          onTap: () {
            ///_navigateToConverter(context);
            onTap(category);          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    category.iconLocation,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    category.name,
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
}
