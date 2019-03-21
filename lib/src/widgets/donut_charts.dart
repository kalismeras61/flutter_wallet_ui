import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DataPerItem {
  final String name;
  final int percent;
  final charts.Color color;

  DataPerItem(this.name, this.percent, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.ArcRendererConfig(arcWidth: 35),
      defaultInteractions: true,
    );
  }
}
