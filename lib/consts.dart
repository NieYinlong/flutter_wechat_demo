import 'package:flutter/material.dart';
import 'package:flutter_wechat_demo/model/conversation.dart';

class AppColors {
  static const AppBarColor = Color(0xff303030);
  static const TabIconNormalColor = Color(0xff999999);
  static const TabIconActiveColor = Color(0xff46c11b);
  static const AppBarPopupMenuColor = Color(0xffffffff);
  static const ConversationTitleColorHEX = 0xff353535;
  static const ConversationTitleItemBgColor = Color(0xffffffff);
  static const TitleTextColor = Color(0xff353535);
  static const DesTextColor = Color(0xff9e9e9e);
  static const DivideColor = Color(0xffd9d9d9);
  static const NotifyDotBgColor = Color(0xffff3e3e);
  static const NotifyDotTextColor = Color(0xffffffff);
  static const DeviceInfoItemBg = Color(0xfff5f5f5);
}

class AppStyles {
  static const TitleStyle = TextStyle(
      fontSize: 16.0,
      color:  AppColors.TitleTextColor
  );

  static const DesStyle = TextStyle(
    fontSize: 14.0,
    color:  AppColors.DesTextColor
  );

  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize: 12,
    color: AppColors.NotifyDotTextColor
  );

  static const DeviceInfoItemTextStyle = TextStyle(
    fontSize: 13,
    color: Color(0xff606062)
  );
}

class Constants {
  static const IconFontFamily = "appIconFont";
  static const ConversationAvatarSize = 48.0;
  static const DivideWidth = 0.40;
}