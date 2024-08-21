
import 'package:flutter/material.dart';
import 'package:random/screens/Constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'Dashboard.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analytics"),
        elevation: 1,
       ),
      drawer: Drawer(
        child: ListView.builder(
            itemCount: drawerOptions.length,
            itemBuilder: (context, index){
              return drawerOptionView(optionName: drawerOptions[index],);
            }),
      ),
      body: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: 500, // Minimum height for the graph
                ),
                child: ERGGraph(),
              ),
              SizedBox(height: 20,),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 500,
                ),
                child: ERGGraph(),
              )
            ],
          ),

      ),
    );
  }
}

//MARK: Data model for ERG

class ERG{
  final String year;
  final double revenue;

  ERG({required this.year, required this.revenue});
}

//Data for ERG

final List<ERG> ergData = [
  ERG(year: "2020", revenue: 500.0),
  ERG(year: "2021", revenue: 550.0),
  ERG(year: "2022", revenue: 605.0),
  ERG(year: "2023", revenue: 565.0),
  ERG(year: "2024", revenue: 730.0),
  ERG(year: "2025", revenue: 800.0),
  ERG(year: "2026", revenue: 875.0)
  //ERG(year: "2027", revenue: 930.0),
];


//ERGraph

class ERGGraph extends StatelessWidget {
  const ERGGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Expected Revenue Growth"),
            SizedBox(height: 20),
            Container(
              height: 400,
              child: BarChart(
                BarChartData(
                  barGroups: ergData
                      .map(
                      (data) => BarChartGroupData(
                          x: int.parse(data.year),
                        barRods: [
                          BarChartRodData(
                              toY: data.revenue,
                            //  edit color etc
                          )
                        ]
                      )
                  )
                      .toList(),
                  titlesData: FlTitlesData(
                    leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta){
                          return Text(
                            value.toInt().toString()
                          );
                        }
                      )
                    ),
                    topTitles: AxisTitles(
                      sideTitles:SideTitles(showTitles: false)
                    )
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: true),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}

