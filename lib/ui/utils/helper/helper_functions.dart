import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//Initialising Camera variable

//Check Name
String? validName(String? name) {
  if (name == null || name.isEmpty) {
    return 'Enter Valid name';
  }
  return null;
}

//Check UserName
String? validUserName(String name) {
  if (!GetUtils.isUsername(name)) {
    return 'Enter Valid Username';
  }
  return null;
}

//Check Valid Email
String? validEmail(String val) {
  if (!GetUtils.isEmail(val)) {
    return 'Enter valid Email';
  }
  return null;
}

String? validPassword(String val) {
  if (val.length < 8) {
    return 'Password must be 8 characters';
  }
  return null;
}

String? validPhone(String val) {
  if (!GetUtils.isPhoneNumber(val)) {
    return 'Enter valid phonenumber';
  }
  return null;
}

hideKyBoard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

String dateFormat(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  // log(formattedDate.toString());
  return formattedDate;
}

String timeFormat(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String formattedDate = DateFormat('hh:mm').format(dateTime);
  // log(formattedDate.toString());
  return formattedDate;
}

numberFormat(int inputNumber) {
  var formattedNumber = NumberFormat.compactCurrency(
    decimalDigits: 2,
    symbol: '',
  ).format(inputNumber);

  // log('Formatted Number is: $formattedNumber');
  return formattedNumber;
}

//appbar flexibleSpace
Image appbarFlexibleSpace = Image(
  height: Platform.isIOS ? 60 : 80, //
  // height: 115,
  width: double.infinity,
  image: const AssetImage(
      'assets/images/bg_appbar.png'), // Replace with your image path
  fit: BoxFit.cover,
);
