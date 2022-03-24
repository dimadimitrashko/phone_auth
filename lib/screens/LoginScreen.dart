import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phone_login/screens/OTPController.dart';
import 'package:phone_login/screens/LoggedInWidget.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dialCodeDigits = "+000";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Padding(padding: const EdgeInsets.only(left: 28.0, right: 28.0)),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "Phone (OTP) Authentication",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 400,
              height: 60,
              child: CountryCodePicker(
                onChanged: (country) {
                  dialCodeDigits = country.dialCode!;
                },
                initialSelection: "UA",
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                favorite: ["+380", "+49"],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(dialCodeDigits),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50, left: 15, right: 15, top: 15),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => OTPControllerScreen(
                            phone: _controller.text,
                            codeDigits: dialCodeDigits,
                          )));
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Sign up with Google',
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final provider =
                          Provider.of<GoogleSignInProvider>(context, listen: false);
                          await provider.googleLogin();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (c) => LoggedInWidget()));
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
