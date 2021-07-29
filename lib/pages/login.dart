import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-scaffold.dart';
import 'package:said/pages/home.dart';
import 'package:said/pages/register.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  // TODO: add phone number as a key
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  RegExp emailRegexValidator = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    caseSensitive: false,
    multiLine: false
  );

  handleLogin() {
    // TODO
    Navigator.push(context, MaterialPageRoute(builder: (context) => SaidScaffold(
      body: Home(),
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFF59E0B),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return AppLocalizations.of(context)!.fieldRequired;
                          
                          
                          if (!emailRegexValidator.hasMatch(value)) {
                            return AppLocalizations.of(context)!.emailInvalid;
                          }

                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "abc@example.com",
                          labelText: AppLocalizations.of(context)!.email
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return AppLocalizations.of(context)!.fieldRequired;

                          if (value.length < 8) {
                            return AppLocalizations.of(context)!.passwordLongerThanEightCharacters;
                          }

                          return null;
                        },
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.passwordChoose,
                          labelText: AppLocalizations.of(context)!.password,
                        ),
                      ),
                      TextButton(
                        child: Text(AppLocalizations.of(context)!.login),
                        onPressed: () {
                          handleLogin();
                        },
                      ),
                      TextButton(
                        child: Text(AppLocalizations.of(context)!.gotoRegistration),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SaidScaffold(
                            body: Register(),
                            hasParent: true,  
                          )));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
  
    );
  }
}