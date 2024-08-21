import 'package:flutter/material.dart';
import 'package:random/screens/Analytics.dart';
import 'package:random/screens/Appointments.dart';
import 'package:random/screens/Constants.dart';
import 'package:random/screens/LeadDetails.dart';

class Dashboard extends StatelessWidget {

   Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        elevation: 1,
      ),
      drawer: Drawer(
        child: ListView.builder(
            itemCount: drawerOptions.length,
            itemBuilder: (context, index){
              return drawerOptionView(optionName: drawerOptions[index],);
            }),
      ),
    );
  }
}

// MARK: class for showing rectangles to add Leads



// MARK: class for showing sidebar options
class drawerOptionView extends StatelessWidget {

  final String optionName;
  const drawerOptionView({super.key, required this.optionName});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(optionName),
          onTap:(){
            Navigator.pop(context);
            switch(optionName){
              case "Dashboard" :
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                );
                break;

              case "Analytics" :
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Analytics()),
                );
                break;

              case "Appointments" :
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Appointments())
                );
                break;

              case "Lead Details" :
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LeadDetails())
                );
                break;
            }
          }
    )
    );
  }
}
