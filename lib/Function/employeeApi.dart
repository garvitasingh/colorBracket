import 'dart:convert';
import 'package:garvita_colorbracket/Constants/app_constants.dart';
import 'package:garvita_colorbracket/Model/employeesModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_config/flutter_config.dart';

class Employee {
  Future<List<EmployeesModel>> get() async {
    http.Response response = await http.get(
      Uri.parse("https://retoolapi.dev/H2F0Ui/getemployedetail"),
    );

    if (response.statusCode == 200) {
      final List employee = json.decode(response.body);
      return employee.map((data) => EmployeesModel.fromJson(data)).toList();
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw Exception("error");
    }
  }

  Future<EmployeesModel?> getDetail(String id) async {
    http.Response response = await http.get(
      Uri.parse("${Constants.employeeUrl}?id=${id}"),
    );

    if (response.statusCode == 200) {
      final employee = json.decode(response.body);
      print(employee[0]);
      EmployeesModel result = EmployeesModel.fromJson(employee[0]);
      return result;
    } else {
      print(response.reasonPhrase);
      throw Exception("error");
    }
  }
}
