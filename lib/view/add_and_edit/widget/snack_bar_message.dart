import 'package:flutter/material.dart';
import 'package:student_get_x/constants/colors.dart';

void snacMasage(BuildContext context, String masage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: kThemeColorGreen, content: Text(masage)),
  );
}
