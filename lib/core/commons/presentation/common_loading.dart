import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohio_templates/core/constant/colors.dart';

class CommonLoading extends StatelessWidget {
  final Color? color;
  const CommonLoading({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Platform.isAndroid
            ? CircularProgressIndicator(
                backgroundColor: color ?? AppColors.primary,
              )
            : CupertinoActivityIndicator(
                color: color ?? AppColors.primary,
              ));
  }
}
