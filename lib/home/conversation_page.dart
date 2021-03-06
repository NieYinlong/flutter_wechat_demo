import 'package:flutter/material.dart';
import '../consts.dart' show AppColors, AppStyles, Constants;
import '../model/conversation.dart' show Conversation, mockConversations, OutLoginDevice;



/// 带下划线表示私有
/// 定义listView中的item
class _ConversationItem extends StatelessWidget {
  const _ConversationItem({Key key, this.conversation})
  : assert(conversation != null),
  super(key: key);

  final conversation;

  @override
  Widget build(BuildContext context) {

    // 根据图片的获取方式初始化头像组件
    Widget avatarWidget;
    if(conversation.isAvatarFromNet()) {
      avatarWidget = Image.network(conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize
      );
    } else {
      avatarWidget = Image.asset(conversation.avatar,
          width: Constants.ConversationAvatarSize,
          height: Constants.ConversationAvatarSize
      );
    }
    avatarWidget = Image.asset(conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize
    );

    // 未读消息角标
    Widget unreadMsgCountText = Container(
      width: 20.0,
      height: 20.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0 / 2),
        color: AppColors.NotifyDotBgColor,
      ),
      child: Text(conversation.unreadMsgCount.toString(), style: AppStyles.UnreadMsgCountDotStyle),
    );


    // 带角标的头像
    Widget avatarContainer;
    if(conversation.unreadMsgCount > 0) {
      // Stack 堆栈布局, 元素可以重叠
      avatarContainer = Stack(
        overflow: Overflow.visible, // 超出范围继续显示
        children: <Widget>[
          avatarWidget,
          Positioned(
            right: -7,
            top: -7,
            child: unreadMsgCountText,
          )
        ],
      );
    } else {
      avatarContainer = avatarWidget;
    }

    // 勿扰模式图标
    Widget muteIcon = Icon(
        IconData(0xe60f, fontFamily: Constants.IconFontFamily),
        color: Color(0xff999999),
        size: 18
    );

    // 透明的
    Widget transparentMuteIcon = Icon(
        IconData(0xe60f, fontFamily: Constants.IconFontFamily),
        color: Colors.transparent,
        size: 18
    );

    // 组件数组
    var _rightArea = <Widget>[
      Text(conversation.createAt, style: AppStyles.DesStyle,),
      SizedBox(height: 10) // 间隔
    ];
    // 如果是勿扰模式则添加勿扰图标widget
    if(conversation.isMute) {
      _rightArea.add(muteIcon);
    } else {
      _rightArea.add(transparentMuteIcon);
    }

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
          avatarContainer,
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
          children: _rightArea,
        ), //
        ],
      ),
    );
  }
}

// 定义电脑端登录item
class _DeviceInfoItem extends StatelessWidget {

  const _DeviceInfoItem({
    this.device = OutLoginDevice.MAC,
  }) : assert(device != null); // assert断言 device初始化时不能为空

  final OutLoginDevice device;

  // get方法
  int get iconName {
    return device == OutLoginDevice.MAC ? 0xe671: 0xe671;
  }

  String get deviceName {
    return device == OutLoginDevice.MAC ? 'MC' : 'Windows';
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:24, top:10, right:24, bottom:10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Constants.DivideWidth, color: AppColors.DivideColor,
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(IconData(
            this.iconName,
            fontFamily: Constants.IconFontFamily
          ), size: 24),
          SizedBox(width: 16),
          Text('$deviceName微信已登录', style: AppStyles.DeviceInfoItemTextStyle)
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
        if(index == 0) {
          return _DeviceInfoItem();
        }
        return _ConversationItem(conversation: mockConversations[index]);
      },
      itemCount: mockConversations.length,
    );
  }
}
