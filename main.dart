import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
        name: 'John Doe',
        email: 'johndoe@example.com',
        phoneNumber: '1234567890'),
    Contact(
        name: 'Jane Smith',
        email: 'janesmith@example.com',
        phoneNumber: '9876543210'),
    Contact(
        name: 'Alice Johnson',
        email: 'Alicejohnson@example.com',
        phoneNumber: '5555555555'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            onTap: () {
              _showContactDetails(context, contact);
            },
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Contact Details:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8.0),
              Text('Name: ${contact.name}'),
              Text('Email: ${contact.email}'),
              Text('Phone Number: ${contact.phoneNumber}'),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ContactListScreen(),
  ));
}
