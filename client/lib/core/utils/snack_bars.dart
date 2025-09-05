import 'package:flutter/material.dart';

import '../../configs/colors.dart';

class SnackBars{
  static openError(BuildContext context,String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: AppColors.error,
      ),
    );
  }

  static openSuccess(BuildContext context,String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: AppColors.success,
      ),
    );
  }
}