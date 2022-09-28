//mongodb authentication
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthService{
  Dio dio = new Dio();
  login(email,password) async{
    try{
      return await dio.post('https://tog-admin.herokuapp.com/authenticate',
      data: {
        'email': email,
        'password': password
      }, options: Options(
        contentType: Headers.formUrlEncodedContentType
      )
      );
    }on DioError catch(e){
      Get.snackbar('Error', e.response!.data);
      print(e.response!.data);
    }
  }

  addUser(email,password) async{
    try{
      return await dio.post('https://tog-admin.herokuapp.com/adduser',
      data: {
        'email': email,
        'password': password
      }, options: Options(
        contentType: Headers.formUrlEncodedContentType
      )
      );
    }on DioError catch(e){
      Get.snackbar('Error', e.response!.data);
      print(e.response!.data);
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