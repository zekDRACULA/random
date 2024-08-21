
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
                  maxHeight: 200,
                ),
                child: LegendView(),
              ),
              SizedBox(height: 20,),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 500,
                ),
                child: SARGraph(),
              ),
              SizedBox(height: 20,),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 500
                ),
                child: RMSGraph(),
              )
            ],
          ),

      ),
    );
  }
}

//legends data 
class Legends{
  final String product;
  final Color color;

  Legends({required this.product, required this.color});
}

//Data for Legends
final List<Legends> legendsData = [
  Legends(product: "Cars", color: Colors.blue),
  Legends(product: "Bikes", color: Colors.green),
  Legends(product: "Watches", color: Colors.orange)
];

//Legend View
class LegendView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: legendsData.map((data) {
          return Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: data.color,
                margin: const EdgeInsets.only(right: 8.0),
              ),
              Text(
                data.product,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// Data model for RMS
class RMS {
  final double carShare;
  final double bikeShare;
  final double watchShare;

  RMS({required this.carShare, required this.bikeShare, required this.watchShare});
}

// Data for RMS
final List<RMS> rmsData = [
  RMS(carShare: 41, bikeShare: 32, watchShare: 27)
];

// RMS Graph
class RMSGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Market Share',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity, // Constrain width
              height: 300, // Set a specific height
              child: PieChart(
                PieChartData(
                  sections: _getPieChartSections(),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _getPieChartSections() {
    final rms = rmsData[0]; // Access the first RMS object from the list

    return [
      PieChartSectionData(
        value: rms.carShare,
        color: Colors.blue,
        title: '${rms.carShare.toStringAsFixed(0)}%',
        radius: 100,
        titleStyle: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: rms.bikeShare,
        color: Colors.green,
        title: '${rms.bikeShare.toStringAsFixed(0)}%',
        radius: 100,
        titleStyle: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: rms.watchShare,
        color: Colors.orange,
        title: '${rms.watchShare.toStringAsFixed(0)}%',
        radius: 100,
        titleStyle: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ];
  }
}


//Data Model for SAR
class SAR{
  final String year;
  final double carRevenue;
  final double bikeRevenue;
  final double watchRevenue;

  SAR({required this.year, required this.carRevenue, required this.bikeRevenue, required this.watchRevenue});
}

//Data for SAR

final List<SAR> sarData = [
  SAR(year: "2018", carRevenue: 464, bikeRevenue: 290, watchRevenue: 213),
  SAR(year: "2019", carRevenue: 424, bikeRevenue: 282, watchRevenue: 169),
  SAR(year: "2020", carRevenue: 445, bikeRevenue: 280, watchRevenue: 302),
  SAR(year: "2021", carRevenue: 498, bikeRevenue: 358, watchRevenue: 291),
  SAR(year: "2022", carRevenue: 368, bikeRevenue: 300, watchRevenue: 200),
  SAR(year: "2023", carRevenue: 379, bikeRevenue: 302, watchRevenue: 253),
  SAR(year: "2024", carRevenue: 316, bikeRevenue: 344, watchRevenue: 319),
];

//SAR graph
// Flutter equivalent of `SARGraph` view
class SARGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Revenue Across Products',
              style: TextStyle(
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 400,
              child: BarChart(
                BarChartData(
                  barGroups: sarData.map((data) {
                    return BarChartGroupData(
                      x: int.parse(data.year),
                      barRods: [
                        BarChartRodData(
                          toY: data.carRevenue,
                          color: Colors.blue,
                          width: 8,
                        ),
                        BarChartRodData(
                          toY: data.bikeRevenue,
                          color: Colors.green,
                          width: 8,
                        ),
                        BarChartRodData(
                          toY: data.watchRevenue,
                          color: Colors.orange,
                          width: 8,
                        ),
                      ],
                    );
                  }).toList(),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                          );
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false)
                    )
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                  ),
                ),
              ),
            ),
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
