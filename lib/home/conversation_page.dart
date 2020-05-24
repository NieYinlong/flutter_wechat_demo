import 'package:flutter/material.dart';
import '../consts.dart' show AppColors, AppStyles, Constants;
import '../model/conversation.dart' show Conversation, mockConversations;

/// 带下划线表示私有
/// 定义listView中的item
class _ConversationItem extends StatelessWidget {
  const _ConversationItem({Key key, this.conversation})
  : assert(conversation != null),
  super(key: key);

  final conversation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10), // padding边框, const代表常量, 这样写可以优化性能
      decoration: BoxDecoration(
          color: AppColors.ConversationTitleItemBgColor,
          border: Border(
           bottom: BorderSide(color: AppColors.DivideColor, width: Constants.DivideWidth),
         )
      ),
      child: Row(
        // 横向布局: 主轴对齐方式, 左 -> 右边
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/ww_main_contact_public_number.png',
            width: Constants.ConversationAvatarSize,
            height: Constants.ConversationAvatarSize,
          ),
          Container(width: 10), // 间隔作用
          // 中间title 和 des, Expanded自动撑起
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(conversation.title, style: AppStyles.TitleStyle),
                Text(conversation.des, style: AppStyles.DesStyle,)
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Text(conversation.createAt, style: AppStyles.DesStyle,)
            ],
          ),
          //
        ],
      ),
    );
  }
}


class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _ConversationItem(conversation: mockConversations[index]);
      },
      itemCount: mockConversations.length,
    );
  }
}
