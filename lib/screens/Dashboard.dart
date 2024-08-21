import 'package:flutter/material.dart';
import 'package:random/screens/Analytics.dart';
import 'package:random/screens/Appointments.dart';
import 'package:random/screens/Constants.dart';
import 'package:random/screens/DrawerOptionView.dart';
import 'package:random/screens/ShowCard.dart'; // Import the ShowCard widget

class Dashboard extends StatelessWidget {
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
          itemBuilder: (context, index) {
            return DrawerOptionView(optionName: drawerOptions[index]);
          },
        ),
      ),
      body: ShowCard(), // Display the ShowCard widget
    );
  }
}
