import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedInWidget extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged In '),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Text(
            'Profile',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          CircleAvatar(
            radius: 130,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          TextFormField(
              initialValue: user.displayName,
            decoration: InputDecoration(labelText: 'Name'),
          ),
        ],
      ),
    );
  }
}
