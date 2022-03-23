import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthorizationForm extends StatefulWidget {
  const AuthorizationForm({Key? key}) : super(key: key);

  @override
  State<AuthorizationForm> createState() => _AuthorizationFormState();
}

class _AuthorizationFormState extends State<AuthorizationForm> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Logged In'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Text(
            'Profile',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 32),

          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          SizedBox(height: 8),
          // Text(
          //   'Name: ' + user.displayName!,
          //   style: TextStyle(color: Colors.white, fontSize: 16),
          // ),
        ],
      ),
    );
  }
}
