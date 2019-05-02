import 'package:profile_page/simple_bar_chart.dart';
import 'package:profile_page/simple_line_chart.dart';
import 'package:profile_page/single_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charts',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Profile Page '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  final mockedData = [
    WeeklyWeight('Week1', 120),
    WeeklyWeight('week2', 110),
    WeeklyWeight('week3', 100),
    WeeklyWeight('week4', 90),
  ];

  /// Create one series with pass in data.
  List<charts.Series<WeeklyWeight, String>> mapChartData(
      List<WeeklyWeight> data) {
    return [
      charts.Series<WeeklyWeight, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (WeeklyWeight sales, _) => sales.week,
        measureFn: (WeeklyWeight sales, _) => sales.weight,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/up2.png',
                    ),
                    new Text("  chest  size: 100 cm",
                      style: new TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),),

                  ],
                ),

                new Text("  "
                    ""
                    ""
                    "",
                  style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/mid2.png',
                    ),
                    new Text("  Waist  size: 90 cm",
                      style: new TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),),

                  ],
                ),
                new Text("  "
                    ""
                    ""
                    "",
                  style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/down2.png',
                    ),
                    new Text("  Hip  size: 120 cm",
                      style: new TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),),

                  ],
                ),
                /*
              new Text("Weight Lost per Week"
                  "",
                style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),),
              Container(
              width: 300.0,
              height: 300.0,
              child: SimpleBarChart(mapChartData(mockedData)),
              ),*/
                new Text("Lifted Weight per Day"
                    "",
                  style: new TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),),
                Container(
                  height: 200.0,
                  width: 400.0,
                  child:  SimpleLineChart.withSampleData(),
                ),

                new Text("Walking Distance per Day"
                    "",
                  style: new TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),),
                Container(
                  height: 200.0,
                  width: 400.0,
                  child:  SingleLineChart.withSampleData(),
                ),

              ],
            ),
          ],
        )
    );
  }
}
