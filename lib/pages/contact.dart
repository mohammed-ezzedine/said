import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 20),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: Color.fromARGB(255, 2, 70, 126),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 10, bottom: 20),
                      child: ImageIcon(AssetImage('assets/icons/email.png')))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 10, bottom: 20),
                child: InkWell(
                  child: Text(
                    "hananimer@saidcrc.org",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 2, 70, 126),
                      fontSize: 17,
                    ),
                  ),
                  onTap: _sendMail,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "Phone",
                      style: TextStyle(
                        color: Color.fromARGB(255, 2, 70, 126),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Column(
                children: [ImageIcon(AssetImage('assets/icons/phone.png'))],
              ),
              Padding(
                padding: EdgeInsets.only(left: 17, bottom: 5, top: 7),
                child: InkWell(
                  child: Text(
                    "+961 3 458476",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 2, 70, 126),
                      fontSize: 17,
                    ),
                  ),
                  onTap: _call1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, bottom: 5, top: 7),
                child: InkWell(
                  child: Text(
                    "+961 81 936779",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 2, 70, 126),
                      fontSize: 17,
                    ),
                  ),
                  onTap: _call2,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(225, 235, 245, 255),
                    onPressed: _insta,
                    child: Image.asset(
                      'assets/icons/insta.png',
                      fit: BoxFit.fill,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 30, left: 30),
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(225, 235, 245, 255),
                    onPressed: _fb,
                    child: Image.asset(
                      'assets/icons/fb.png',
                      fit: BoxFit.fill,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 30, left: 30),
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(225, 235, 245, 255),
                    onPressed: _linkedIn,
                    child: Image.asset(
                      'assets/icons/lkndn.png',
                      fit: BoxFit.fill,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 30, left: 30),
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(225, 235, 245, 255),
                    onPressed: _twitter,
                    child: Image.asset(
                      'assets/icons/twitter.png',
                      fit: BoxFit.fill,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

void _sendMail() async =>
    await launchUrl(Uri.parse('mailto:hananimer@saidcrc.org'));

void _call1() async => await launchUrl(Uri.parse('tel:+9613458476'));
void _call2() async => await launchUrl(Uri.parse('tel:+96181936779'));
void _insta() async =>
    await launchUrl(Uri.parse('https://www.instagram.com/saidngo/?hl=en'));
void _fb() async =>
    await launchUrl(Uri.parse('https://www.facebook.com/saidcrc.org'));
void _linkedIn() async =>
    await launchUrl(Uri.parse('https://www.linkedin.com/in/saidngo/'));
void _twitter() async =>
    await launchUrl(Uri.parse('https://twitter.com/SAIDNG0'));
