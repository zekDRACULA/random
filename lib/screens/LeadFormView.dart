import 'package:flutter/material.dart';

class Lead {
  final String name;
  final String leadSource;
  final String company;
  final String phoneNumber;
  final String email;

  Lead({
    required this.name,
    required this.leadSource,
    required this.company,
    required this.phoneNumber,
    required this.email,
  });
}

class LeadView extends ChangeNotifier {
  static final LeadView _instance = LeadView._internal();

  factory LeadView() {
    return _instance;
  }

  LeadView._internal();

  String name = '';
  String leadSource = '';
  String company = '';
  String phoneNumber = '';
  String email = '';

  List<Lead> leadsList = [];

  void addLead() {
    final newLead = Lead(
      name: name,
      leadSource: leadSource,
      company: company,
      phoneNumber: phoneNumber,
      email: email,
    );
    leadsList.add(newLead);
    name = '';
    leadSource = '';
    company = '';
    phoneNumber = '';
    email = '';
    notifyListeners();
  }
}

class LeadDetailView extends StatelessWidget {
  final LeadView view = LeadView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lead Details'),
      ),
      body: view.leadsList.isEmpty
          ? Center(child: Text('No Leads'))
          : ListView.builder(
        itemCount: view.leadsList.length,
        itemBuilder: (context, index) {
          final lead = view.leadsList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Name:', lead.name),
                  _buildDetailRow('Company:', lead.company),
                  _buildDetailRow('Lead Source:', lead.leadSource),
                  _buildDetailRow('Email:', lead.email),
                  _buildDetailRow('Phone Number:', lead.phoneNumber),
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

class LeadFormView extends StatelessWidget {
  final LeadView view = LeadView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Lead'),
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
              decoration: InputDecoration(labelText: 'Lead Source'),
              onChanged: (value) {
                view.leadSource = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Company'),
              onChanged: (value) {
                view.company = value;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    onChanged: (value) {
                      view.phoneNumber = value;
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                    onChanged: (value) {
                      view.email = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                view.addLead();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LeadDetailView()),
                );
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}


