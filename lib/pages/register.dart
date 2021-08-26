import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-scaffold.dart';
import 'package:said/models/registrationRequest.dart';
import 'package:said/pages/home.dart';
import 'package:said/services/api.dart';
import 'package:said/services/encoder.dart';
import 'package:said/services/storage.dart';

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

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _question1RelationController = TextEditingController();
  TextEditingController _question2YearController = TextEditingController();
  TextEditingController _question4PurposeController = TextEditingController();
  String ageGroup = '';
  int ageGroupNumber = 0;
  String gender = '';
  bool isMale = false;
  String governorate = '';
  int governorateNumber = 0;
  String question1 = '';
  bool familyHistory = false;
  String question2 = '';
  bool previousHistory = false;
  String question4 = '';
  String purpose = '';

  bool inflammatoryDiseaseCheckbox = false;
  bool familialPolyposisCheckbox = false;
  bool crohnDiseaseCheckbox = false;
  bool lynchDiseaseCheckbox = false;

  RegExp phoneRegexValidator = RegExp(
    r"^[0-9]{2}/?[0-9]{6}$",
    caseSensitive: false,
    multiLine: false
  );

  handleRegistry() {

    var request = RegistrationRequest(
      Name: _nameController.text,
      Phone: _phoneController.text,
      Password: _passwordController.text,
      AgeGroup: ageGroupNumber,
      isMale: isMale,
      Governorate: governorateNumber,
      familyHistory: familyHistory,
      familyHistoryRelation: _question1RelationController.text,
      previousHistory: previousHistory,
      previousHistoryYear: _question2YearController.text,
      inflammatoryDisease: inflammatoryDiseaseCheckbox,
      familialPolyposis: familialPolyposisCheckbox,
      crohnDisease: crohnDiseaseCheckbox,
      lynchSyndrome: lynchDiseaseCheckbox,
      downloadPurpose: (purpose == '')? _question4PurposeController.text : purpose
    );

    register(request)
      .then((value) => 
        Navigator.push(context, MaterialPageRoute(builder: (context) => SaidScaffold(
          body: Home(),
        )))
      );
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

    var ageGroupItemsOptions = [ 
      AppLocalizations.of(context)!.ageOption1,
      AppLocalizations.of(context)!.ageOption2,
      AppLocalizations.of(context)!.ageOption3
    ];

    var governorateOptions = [ 
      AppLocalizations.of(context)!.governorateOption1,
      AppLocalizations.of(context)!.governorateOption2,
      AppLocalizations.of(context)!.governorateOption3,
      AppLocalizations.of(context)!.governorateOption4,
      AppLocalizations.of(context)!.governorateOption5,
      AppLocalizations.of(context)!.governorateOption6,
      AppLocalizations.of(context)!.governorateOption7,
      AppLocalizations.of(context)!.governorateOption8
    ];

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
                                
                                return null;
                              },
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.name
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
                                  ageGroupNumber = ageGroupItemsOptions.indexOf(newValue);
                                });
                              },
                              items: ageGroupItemsOptions
                                .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                                .toList()
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
                                  isMale = (newValue == AppLocalizations.of(context)!.genderOption1);
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
                                  governorateNumber = governorateOptions.indexOf(newValue);
                                });
                              },
                              items: governorateOptions
                                .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                                .toList(),
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
                                  familyHistory = question1 == AppLocalizations.of(context)!.yes;
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
                                  previousHistory = newValue == AppLocalizations.of(context)!.yes;
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
                                controller: _question2YearController,
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
                                  if (newValue != AppLocalizations.of(context)!.registrationQ4O3) {
                                    purpose = newValue;
                                  } else {
                                    purpose = '';
                                  }
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