import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SingleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SingleLineChart(this.seriesList, {this.animate});


  factory SingleLineChart.withSampleData() {
    return new SingleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,

    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, behaviors: [
      new charts.SeriesLegend(position: charts.BehaviorPosition.end),
    ],animate: animate);
  }
  static List<charts.Series<MyData, int>> _createSampleData() {
    final data = [
      new MyData(0 , 10),
      new MyData(1, 11),
      new MyData(2, 7),
      new MyData(3, 10),
    ];


    return [
      new charts.Series<MyData, int>(
        id: 'Walking Distance (km)',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (MyData sales, _) => sales.x,
        measureFn: (MyData sales, _) => sales.y,
        data: data,
      )
    ];
  }
}



/// Sample linear data type.
class MyData {
  final int x;
  final int y;

  MyData(this.x, this.y);
}