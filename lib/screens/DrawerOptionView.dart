import 'package:flutter/material.dart';
import 'package:random/screens/Analytics.dart';
import 'package:random/screens/Appointments.dart';
import 'package:random/screens/Dashboard.dart';
import 'package:random/screens/LeadFormView.dart';

class DrawerOptionView extends StatelessWidget {
  final String optionName;

  const DrawerOptionView({Key? key, required this.optionName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(optionName),
        onTap: () {
          Navigator.pop(context);
          switch (optionName) {
            case "Dashboard":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
              break;
            case "Analytics":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Analytics()),
              );
              break;
            case "Appointments":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Appointments()),
              );
              break;
            case "Lead Details":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LeadDetailView()),
              );
              break;
            default:
              print("No route found");
          }
        },
      ),
    );
  }
}
