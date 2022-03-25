import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

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
        padding: EdgeInsets.all(10),
        children: [
          Text(
            'Profile',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          // CircleAvatar(
          //   radius: 130,
          //   backgroundImage: NetworkImage(user.photoURL!),
          // ),
          TextFormField(
            initialValue: user.displayName,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            initialValue: user.email,
            decoration: InputDecoration(labelText: 'email'),
          ),
          SizedBox(height: 150),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => LoginScreen()));
              },
              child: Text('Logout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold))),
          // Row(
          //   children: [
          //     ButtonWidget(
          //       text:'qkwrj',
          //       Icons.
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
