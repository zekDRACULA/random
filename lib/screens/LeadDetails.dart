import 'package:flutter/material.dart';
import 'package:random/screens/Constants.dart';

import 'Dashboard.dart';


class LeadDetails extends StatelessWidget {
  const LeadDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lead Details"),
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
