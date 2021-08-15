import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-scaffold.dart';
import 'package:said/pages/home.dart';
import 'package:said/pages/register.dart';
import 'package:said/services/api.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  RegExp phoneRegexValidator = RegExp(
    r"^[0-9]{2}/?[0-9]{6}$",
    caseSensitive: false,
    multiLine: false
  );

  bool failure = false;

  handleLogin() {

    login(_phoneController.text, _passwordController.text)
      .then((value) => {
        if (value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SaidScaffold(
            body: Home(),
          )))
        } else {
          setState(() {
            _phoneController.clear();
            _passwordController.clear();
            failure = true;
          })
        }
      });    
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
                if (failure)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      AppLocalizations.of(context)!.invalidLogin,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
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

                          if (!phoneRegexValidator.hasMatch(value)) {
                            return AppLocalizations.of(context)!.emailInvalid;
                          }

                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        decoration: InputDecoration(
                          hintText: "01 230 456",
                          labelText: AppLocalizations.of(context)!.phone,
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