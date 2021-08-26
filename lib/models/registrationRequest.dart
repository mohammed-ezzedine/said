import 'dart:convert';

import 'package:said/services/encoder.dart';

class RegistrationRequest {
  String Name;
  String Phone;
  String Password;
  int AgeGroup;
  bool isMale;
  int Governorate;
  bool familyHistory;
  String? familyHistoryRelation;
  bool previousHistory;
  String? previousHistoryYear;
  bool inflammatoryDisease;
  bool familialPolyposis;
  bool crohnDisease;
  bool lynchSyndrome;
  String downloadPurpose;

  RegistrationRequest({
    required this.Name,
    required this.Phone,
    required this.Password,
    required this.AgeGroup,
    required this.isMale,
    required this.Governorate,
    required this.familyHistory,
    required this.familyHistoryRelation,
    required this.previousHistory,
    required this.previousHistoryYear,
    required this.inflammatoryDisease,
    required this.familialPolyposis,
    required this.crohnDisease,
    required this.lynchSyndrome,
    required this.downloadPurpose
  });

  String toJsonString() {
    return jsonEncode({
      "username": this.Name,
      "Name": this.Name,
      "email": "+961" + this.Phone + '@saidcrc.com',
      'Phone': "+961" + this.Phone,
      "password": this.Password,
      "AgeGroup": this.AgeGroup,
      "isMale": this.isMale,
      "Governorate": this.Governorate,
      "familyHistory": this.familyHistory,
      "familyHistoryRelation": this.familyHistoryRelation,
      "previousHistory": this.previousHistory,
      "previousHistoryYear": this.previousHistoryYear,
      "inflammatoryDisease": this.inflammatoryDisease,
      "familialPolyposis": this.familialPolyposis,
      "crohnDisease": this.crohnDisease,
      "lynchSyndrome": this.lynchSyndrome,
      "downloadPurpose": this.downloadPurpose
    });
  }
}