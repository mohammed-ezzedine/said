import 'package:flutter/material.dart';

import 'package:said/components/said-title.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterForFIT extends StatefulWidget {
  const RegisterForFIT({Key? key}) : super(key: key);

  @override
  _RegisterForFITState createState() => _RegisterForFITState();
}

class _RegisterForFITState extends State<RegisterForFIT> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SaidTitle(
              text:
                  "Register for the F.I.T. b y cliking the button below and choosing the closest Laboratory to you"),
          Center(
            child: TextButton.icon(
                onPressed: _launchURL,
                icon: Icon(
                  Icons.app_registration,
                  color: Color.fromARGB(255, 2, 70, 126),
                ),
                label: Text(
                  "Register",
                  style: TextStyle(color: Color.fromARGB(255, 2, 70, 126)),
                )),
            /*
            child: InkWell(
              child: Text("Register"),
              onTap: () => {
                'https://docs.flutter.io/flutter/services/UrlLauncher-class.html'
              },
            ),*/
          )
        ],
      ),
    );
  }
}

void _launchURL() async => await launch(
    'https://docs.google.com/forms/d/1Uq4z3Pdso2CBlUhRwNK9hyzgDtNGq6Nrc1ZuJvTx9EI/viewform?edit_requested=true%23responses');
