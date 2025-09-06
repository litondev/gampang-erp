import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'snack_bars.dart';

class UtilFormats {
  static String formatCurrency(double value) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    return format.format(value);
  }

  static String formatDate(DateTime date, {String pattern = 'dd MMM yyyy'}) {
    final formatter = DateFormat(pattern);
    return formatter.format(date);
  }

  static formatPrintErrorHttp(Response response){
    final body = json.decode(response.body);

    if(response.statusCode == 500){      
      print("Error : $body['message']");
    }else if(response.statusCode == 422){
      print("Error : $body['message']");
    }else if(response.statusCode == 401){
      print("Error : $body['message']");
    }else{
      print("Terjadi Kesalahan");
    }
  }

  static formatErrorHttp(Response response,BuildContext context){
    final body = json.decode(response.body);

    if(response.statusCode == 500){
      formatPrintErrorHttp(response);

      UtilSnackBars.openError(context,body['message'] ?? 'Terjadi Kesalahan');
    }else if(response.statusCode == 422){
      formatPrintErrorHttp(response);
      
      UtilSnackBars.openError(context,body['message'] ?? 'Terjadi Kesalahan');
    }else if(response.statusCode == 401){
      formatPrintErrorHttp(response);
      
      UtilSnackBars.openError(context,body['message'] ?? 'Terjadi Kesalahan');
    }else{
      formatPrintErrorHttp(response);

      UtilSnackBars.openError(context,"Terjadi Kesalahan");
    }
  }
}
