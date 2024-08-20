import 'package:flutter/material.dart';
import 'package:random/screens/Constants.dart';

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
    );
  }
}

