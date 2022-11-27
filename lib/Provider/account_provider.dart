import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'package:http_parser/http_parser.dart';

import '../Constants/app_constants.dart';
import '../Model/userModel.dart';

final accountProvider = ChangeNotifierProvider((ref) => AccountProvider());

class AccountProvider extends ChangeNotifier{

  List<UserModel> userData = [];
  late UserModel allData;

  Future<String> login(
  {required String userId,
  required String pass}) async {
    notifyListeners();
    userData.clear();
    String result = Constants.SUCCESS;
    try{
      var request = http.MultipartRequest('GET', Uri.parse('${Constants.userUrl}?user_id=${userId}&password=${pass}'));

      http.StreamedResponse response = await request.send();
      var res= await response.stream.bytesToString();
      if (response.statusCode == 200) {
        final decodeData = json.decode(res);
        // print(res);
        print(decodeData.toString());
        notifyListeners();
        result = Constants.SUCCESS;
      }
      else {
        print(response.reasonPhrase);
        result = Constants.FAILED;
      }

    }catch (e){
      result = Constants.FAILED;
    }

    notifyListeners();

    return result;
  }


}
