import 'package:flutter/material.dart';

class Appointment {
  final String name;
  final String company;
  final String message;

  Appointment({
    required this.name,
    required this.company,
    required this.message,
  });
}
class AppointmentsView extends ChangeNotifier {
  static final AppointmentsView _instance = AppointmentsView._internal();

  factory AppointmentsView() {
    return _instance;
  }

  AppointmentsView._internal();

  String name = '';
  String company = '';
  String message = '';

  List<Appointment> appointmentList = [];

  void addAppointment() {
    final newAppointment = Appointment(
      name: name,
      company: company,
      message: message,
    );
    appointmentList.add(newAppointment);
    name = '';
    company = '';
    message = '';
    notifyListeners();
  }
}
class AppointmentFormView extends StatelessWidget {
  final AppointmentsView view = AppointmentsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                view.name = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Company'),
              onChanged: (value) {
                view.company = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Message'),
              onChanged: (value) {
                view.message = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                view.addAppointment();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentView()),
                );
              },
              child: Text('Add Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
class AppointmentView extends StatelessWidget {
  final AppointmentsView view = AppointmentsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Appointments'),
      ),
      body: view.appointmentList.isEmpty
          ? Center(child: Text('No Appointments'))
          : ListView.builder(
        itemCount: view.appointmentList.length,
        itemBuilder: (context, index) {
          final appointment = view.appointmentList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Name:', appointment.name),
                  _buildDetailRow('Company:', appointment.company),
                  _buildDetailRow('Message:', appointment.message),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 10),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
