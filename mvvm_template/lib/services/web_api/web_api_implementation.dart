import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mvvm_template/business_logic/models/test_model.dart';
import 'package:mvvm_template/constants/project_text.dart';
import 'package:mvvm_template/services/web_api/web_api.dart';
import 'package:http/http.dart' as http;

class WebApiImplementation implements WebApi {

  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  @override
  Future<dynamic> sampleGet() async {
    try {
      http.Response response = await http.get(
        Uri.https("${ProjectTextConstant.apiEndpoint}/api/v1/users/favourites", ""),
        headers: _headers,
      );
      print("sampleGet response.body: ${response.body}");
      return TestModel.fromJson(json.decode(response.body));
    } on SocketException {
      print("SocketException");
      throw SocketException('No Internet connection');
    } on TimeoutException {
      print("TimeoutException");
      throw TimeoutException("Something wrong with the connection");
    }
  }

  @override
  Future<dynamic> samplePost(String requestBody) async {
    try {
      http.Response response = await http.post(
        Uri.https("${ProjectTextConstant.apiEndpoint}/api/v1/users/favourites", ""),
        headers: _headers,
        body: requestBody,
      );
      print("samplePost response.body: ${response.body}");
      return TestModel.fromJson(json.decode(response.body));
    } on SocketException {
      print("SocketException");
      throw SocketException('No Internet connection');
    } on TimeoutException {
      print("TimeoutException");
      throw TimeoutException("Something wrong with the connection");
    }
  }
}