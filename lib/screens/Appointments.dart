import 'package:flutter/material.dart';
import 'package:random/screens/Constants.dart';

import 'Dashboard.dart';
import 'DrawerOptionView.dart';


class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments"),
        elevation: 1,
      ),
      drawer: Drawer(
        child: ListView.builder(
            itemCount: drawerOptions.length,
            itemBuilder: (context, index){
              return DrawerOptionView(optionName: drawerOptions[index],);
            }),
      ),
    );
  }
}
