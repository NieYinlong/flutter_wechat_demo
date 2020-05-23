import 'package:flutter/cupertino.dart';
import '../consts.dart' show AppColors;

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
}

const  List<Conversation> mockConversations = [
  const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/31.jpg',
      title: '你好啊',
      des: '',
      createAt: '昨天',
      isMute: false,
      unreadMsgCount: 1,
   ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/27.jpg',
    title: '很高兴认识你',
    des: '这是描述',
    createAt: '前天',
    isMute: false,
    unreadMsgCount: 0,
  ),

];
