import 'package:flutter/cupertino.dart';
import '../consts.dart' show AppColors;

// 外部登录设备枚举
enum OutLoginDevice{
  MAC,
  WIN
}

class Conversation {
  const Conversation({
    @required this.avatar,
    @required this.title,
    this.titleColor: AppColors.ConversationTitleColorHEX,
    this.des,
    @required this.createAt,
    this.isMute: false,
    this.unreadMsgCount: 0,
    this.displayDot: false,
  }) :  assert(avatar != null),
        assert(title != null),
        assert(createAt != null);
  // : assert断言, 编译过程检查代码,有不符合断言的部分就会报错  提高程序健壮性

  final String avatar;
  final String title;
  final int titleColor;
  final String des;
  final String createAt;
  final bool isMute;
  final int unreadMsgCount; // 未读数量
  final bool displayDot;

  bool isAvatarFromNet() {
    if(this.avatar.indexOf('http') == 0 || this.avatar.indexOf('https') == 0){
      return true;
    }
    return false;
  }

}

const  List<Conversation> mockConversations = [
  const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/31.jpg',
      title: '欧阳娜娜22',
      des: '今天晚上10点到家',
      createAt: '昨天',
      isMute: true,
      unreadMsgCount: 0,
   ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/27.jpg',
    title: '迪丽热巴',
    des: '明天一起去逛该',
    createAt: '09:02',
    isMute: false,
    unreadMsgCount: 1,
  ),

  const Conversation(
    avatar: 'assets/images/ww_main_contact_public_number.png',
    title: '本地照片',
    des: '这是本地照片',
    createAt: '17:20',
    isMute: true,
    unreadMsgCount: 2,
  ),

];
