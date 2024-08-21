import 'package:flutter/material.dart';
import 'package:random/screens/AppointmentFormView.dart';
import 'package:random/screens/Appointments.dart';
import 'package:random/screens/LeadFormView.dart';


class ShowCard extends StatefulWidget {
  @override
  _ShowCardState createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard> {
  final List<String> dashboardOptions = ['Leads', 'Open Tasks', 'Appointments'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: dashboardOptions.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _dashboardCard(dashboardOptions[index]);
        },
      ),
    );
  }

  Widget _dashboardCard(String dashboardOption) {
    return GestureDetector(
      onTap: () => _handleButtonPress(dashboardOption),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  dashboardOption,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: Colors.white, size: 40),
                  Text("Create New", style: TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleButtonPress(String dashboardOption) {
    switch (dashboardOption) {
      case 'Leads':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LeadFormView()), // Example navigation
        );
        break;
      case 'Appointments':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppointmentFormView()), // Example navigation
        );
        break;
      default:
        print("Nothing");
    }
  }
}
