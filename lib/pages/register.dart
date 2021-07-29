import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-scaffold.dart';
import 'package:said/pages/home.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  int _currentStep = 0;
  int _numberOfSteps = 3;

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  // TODO: change email to optional
  // TODO: add name
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _question1RelationController = TextEditingController();
  TextEditingController _question2RelationController = TextEditingController();
  TextEditingController _question4PurposeController = TextEditingController();
  String ageGroup = '';
  String gender = '';
  String governorate = '';
  String question1 = '';
  String question2 = '';
  String question4 = '';

  bool inflammatoryDiseaseCheckbox = false;
  bool familialPolyposisCheckbox = false;
  bool crohnDiseaseCheckbox = false;
  bool lynchDiseaseCheckbox = false;

  RegExp emailRegexValidator = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    caseSensitive: false,
    multiLine: false
  );

  RegExp phoneRegexValidator = RegExp(
    r"^[0-9]{2}/?[0-9]{6}$",
    caseSensitive: false,
    multiLine: false
  );

  handleRegistry() {
    // TODO
    Navigator.push(context, MaterialPageRoute(builder: (context) => SaidScaffold(
      body: Home(),
    )));
  }

  tapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  continued(){
    if (!_formKey1.currentState!.validate()
     || !_formKey2.currentState!.validate()
     || !_formKey3.currentState!.validate())
     {
       return null;
     }

    if ( _currentStep >= _numberOfSteps - 1) {
      handleRegistry();
      return;
    }

    setState(() => _currentStep += 1);
  }

  cancel(){
    _currentStep > 0 ?
        setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      ageGroup = (ageGroup == '')? AppLocalizations.of(context)!.ageOption1 : ageGroup;
      gender = (gender == '')? AppLocalizations.of(context)!.genderOption1 : gender;
      governorate = (governorate == '') ? AppLocalizations.of(context)!.governorateOption1 : governorate;
      question1 = (question1 == '') ? AppLocalizations.of(context)!.no : question1;
      question2 = (question2 == '') ? AppLocalizations.of(context)!.no : question2;
      question4 = (question4 == '') ? AppLocalizations.of(context)!.registrationQ4O1 : question4;
    });

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              AppLocalizations.of(context)!.createAccount,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFF59E0B),
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: Stepper(
              currentStep: _currentStep,
              onStepCancel: cancel,
              onStepContinue: continued,
              onStepTapped: (step) => tapped(step),
              physics: ScrollPhysics(),
              steps: [
                Step(
                  title: Text(AppLocalizations.of(context)!.step + " 1"),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0 ?
                  StepState.complete : StepState.disabled,
                  content: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formKey1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Step(
                  title: Text(AppLocalizations.of(context)!.step + " 2"),
                  isActive: _currentStep >= 1,
                  state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
                  content: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formKey2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(AppLocalizations.of(context)!.age),
                            DropdownButton<String>(
                              value: ageGroup,

                              hint: Text(AppLocalizations.of(context)!.age),
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  ageGroup = newValue!;
                                });
                              },
                              items: <String>[ 
                                AppLocalizations.of(context)!.ageOption1,
                                AppLocalizations.of(context)!.ageOption2,
                                AppLocalizations.of(context)!.ageOption3
                               ]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            Divider(),
                            Text(AppLocalizations.of(context)!.gender),
                            DropdownButton<String>(
                              value: gender,

                              hint: Text(AppLocalizations.of(context)!.age),
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  gender = newValue!;
                                });
                              },
                              items: <String>[ 
                                AppLocalizations.of(context)!.genderOption1,
                                AppLocalizations.of(context)!.genderOption2
                               ]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            Divider(),
                            Text(AppLocalizations.of(context)!.governorate),
                            DropdownButton<String>(
                              value: governorate,

                              hint: Text(AppLocalizations.of(context)!.age),
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  governorate = newValue!;
                                });
                              },
                              items: <String>[ 
                                AppLocalizations.of(context)!.governorateOption1,
                                AppLocalizations.of(context)!.governorateOption2,
                                AppLocalizations.of(context)!.governorateOption3,
                                AppLocalizations.of(context)!.governorateOption4,
                                AppLocalizations.of(context)!.governorateOption5,
                                AppLocalizations.of(context)!.governorateOption6,
                                AppLocalizations.of(context)!.governorateOption7,
                                AppLocalizations.of(context)!.governorateOption8
                               ]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Step(
                  title: Text(AppLocalizations.of(context)!.step + " 3"),
                  isActive: _currentStep >= 2,
                  state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
                  content: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formKey3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(AppLocalizations.of(context)!.registrationQ1),
                            DropdownButton<String>(
                              value: question1,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  question1 = newValue!;
                                });
                              },
                              items: <String>[ 
                                AppLocalizations.of(context)!.yes,
                                AppLocalizations.of(context)!.no
                               ]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            if (question1 == AppLocalizations.of(context)!.yes)
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!.registrationQ1A
                                ),
                                controller: _question1RelationController,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return AppLocalizations.of(context)!.fieldRequired;

                                  return null;
                                },
                              ),

                            Divider(),
                            Text(AppLocalizations.of(context)!.registrationQ2),
                            DropdownButton<String>(
                              value: question2,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  question2 = newValue!;
                                });
                              },
                              items: <String>[ 
                                AppLocalizations.of(context)!.yes,
                                AppLocalizations.of(context)!.no
                               ]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            if (question2 == AppLocalizations.of(context)!.yes)
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!.registrationQ2A
                                ),
                                controller: _question2RelationController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return AppLocalizations.of(context)!.fieldRequired;

                                  return null;
                                },
                              ),

                            Divider(),
                            Text(AppLocalizations.of(context)!.registrationQ3),
                            Column(
                              children: [
                                CheckboxListTile(
                                  value: inflammatoryDiseaseCheckbox,
                                  title: Text(AppLocalizations.of(context)!.registrationQ3O1),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      inflammatoryDiseaseCheckbox = value!;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  value: familialPolyposisCheckbox,
                                  title: Text(AppLocalizations.of(context)!.registrationQ3O2),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      familialPolyposisCheckbox = value!;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  value: crohnDiseaseCheckbox,
                                  title: Text(AppLocalizations.of(context)!.registrationQ3O3),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      crohnDiseaseCheckbox = value!;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  value: lynchDiseaseCheckbox,
                                  title: Text(AppLocalizations.of(context)!.registrationQ3O4),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      lynchDiseaseCheckbox = value!;
                                    });
                                  },
                                ),
                              ],
                            ),

                            Divider(),
                            Text(AppLocalizations.of(context)!.registrationQ4),
                            DropdownButton<String>(
                              value: question4,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  question4 = newValue!;
                                });
                              },
                              items: <String>[ 
                                AppLocalizations.of(context)!.registrationQ4O1,
                                AppLocalizations.of(context)!.registrationQ4O2,
                                AppLocalizations.of(context)!.registrationQ4O3
                               ]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            if (question4 == AppLocalizations.of(context)!.registrationQ4O3)
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!.registrationQ4O3E
                                ),
                                controller: _question4PurposeController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return AppLocalizations.of(context)!.fieldRequired;

                                  return null;
                                },
                              ),

                            // Text(AppLocalizations.of(context)!.gender),
                            // DropdownButton<String>(
                            //   value: gender,

                            //   hint: Text(AppLocalizations.of(context)!.age),
                            //   icon: const Icon(Icons.arrow_downward),
                            //   iconSize: 24,
                            //   elevation: 16,
                            //   style: const TextStyle(color: Colors.deepPurple),
                            //   underline: Container(
                            //     height: 2,
                            //     color: Colors.deepPurpleAccent,
                            //   ),
                            //   onChanged: (String? newValue) {
                            //     setState(() {
                            //       gender = newValue!;
                            //     });
                            //   },
                            //   items: <String>[ 
                            //     AppLocalizations.of(context)!.genderOption1,
                            //     AppLocalizations.of(context)!.genderOption2
                            //    ]
                            //       .map<DropdownMenuItem<String>>((String value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: Text(value),
                            //     );
                            //   }).toList(),
                            // ),
                            // Divider(),
                            // Text(AppLocalizations.of(context)!.governorate),
                            // DropdownButton<String>(
                            //   value: governorate,

                            //   hint: Text(AppLocalizations.of(context)!.age),
                            //   icon: const Icon(Icons.arrow_downward),
                            //   iconSize: 24,
                            //   elevation: 16,
                            //   style: const TextStyle(color: Colors.deepPurple),
                            //   underline: Container(
                            //     height: 2,
                            //     color: Colors.deepPurpleAccent,
                            //   ),
                            //   onChanged: (String? newValue) {
                            //     setState(() {
                            //       governorate = newValue!;
                            //     });
                            //   },
                            //   items: <String>[ 
                            //     AppLocalizations.of(context)!.governorateOption1,
                            //     AppLocalizations.of(context)!.governorateOption2,
                            //     AppLocalizations.of(context)!.governorateOption3,
                            //     AppLocalizations.of(context)!.governorateOption4,
                            //     AppLocalizations.of(context)!.governorateOption5,
                            //     AppLocalizations.of(context)!.governorateOption6,
                            //     AppLocalizations.of(context)!.governorateOption7,
                            //     AppLocalizations.of(context)!.governorateOption8
                            //    ]
                            //       .map<DropdownMenuItem<String>>((String value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: Text(value),
                            //     );
                            //   }).toList(),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
    
        ],
      )
      
      
     );
  }
}