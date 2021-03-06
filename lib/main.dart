import 'package:flutter/material.dart';
import './consts.dart' show AppColors;
import './home/home_screen.dart';


void main() => runApp(
  MaterialApp(
    title: '微信',
    theme: ThemeData.light().copyWith(
      primaryColor: AppColors.AppBarColor,
      cardColor: AppColors.AppBarColor // 设置popMenu主题色
    ),
    home: HomeScreen(),
  )
);
