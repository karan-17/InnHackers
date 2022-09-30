//mongodb authentication
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:innhacks/widget_tree.dart';

class AuthService{
  Dio dio = new Dio();
  login(name,email,password, role, username) async{
    final someRole=role;
    try{
      return await dio.post('https://tog-admin.herokuapp.com/login-'+someRole,
      data: {
        "name": name,
        'email': email,
        'password': password,
        'role':role,
        'username': username,
      }, options: Options(
        contentType: Headers.formUrlEncodedContentType
      ));
    }on DioError catch(e){
      Get.snackbar('Error', e.response?.data['message']);
      print(e.response!.data);
    }
  }

  addUser(name,email,password, role, username) async{
    final someRole=role;
    try{
      return await dio.post('https://tog-admin.herokuapp.com/register-'+someRole,
      data: {
        "name": name,
        'email': email,
        'password': password,
        'role':role,
        'username': username,
      }, options: Options(
        contentType: Headers.formUrlEncodedContentType
      )
      );
    }on DioError catch(e){
      Get.snackbar('Error', e.response?.data);
      print(e.response?.data);
    }
  }

  getinfo(token)async{
    try{
      return await dio.get('https://tog-admin.herokuapp.com/getinfo',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        }
      )
      );
    }on DioError catch(e){
      Get.snackbar('Error', e.response!.data);
      print(e.response!.data);
    }
  }
  getvolunteer(token)async{
    try{
      return await dio.get('https://tog-admin.herokuapp.com/dashboard',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        }
      )
      );
    }on DioError catch(e){
      Get.snackbar('Error', e.response!.data);
      print(e.response!.data);
    }
  }

}