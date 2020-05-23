import 'package:flutter/material.dart';
import 'package:flutter_wechat_demo/model/conversation.dart';



class AppColors {
  static const  AppBarColor = Color(0xff303030);
  static const  TabIconNormalColor = Color(0xff999999);
  static const  TabIconActiveColor = Color(0xff46c11b);
  static const  AppBarPopupMenuColor = Color(0xffffffff);
  static const  ConversationTitleColorHEX = 0xff353535;
  static const  ConversationTitleItemBgColor = Color(0xffffffff);

  static const  TitleTextColor = Color(0xff353535);
  static const  DesTextColor = Color(0xff9e9e9e);
}

class AppStyles {
  static const TitleStyle = TextStyle(
      fontSize: 18.0,
      color:  AppColors.TitleTextColor
  );

  static const DesStyle = TextStyle(
    fontSize: 14.0,
    color:  AppColors.DesTextColor
  );

}

class Constants {
  static const IconFontFamily = "appIconFont";
  static const ConversationAvatarSize = 48.0;
}