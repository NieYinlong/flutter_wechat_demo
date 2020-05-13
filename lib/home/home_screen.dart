import 'package:flutter/material.dart';
import '../consts.dart' show Constants, AppColors;

// 定义枚举
enum ActionItems {
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
}

class NavigationIconView {
  final String _title; // 带下划线就是私有的
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}):
      _title = title,
      _icon = icon,
      _activeIcon = activeIcon,
      item = BottomNavigationBarItem(
        icon: Icon(icon, color: AppColors.TabIconNormalColor),
        activeIcon: Icon(activeIcon, color: AppColors.TabIconActiveColor),
        title: Text(title, style: TextStyle(
          fontSize: 14,
          color: AppColors.TabIconNormalColor
        )),
        backgroundColor: Colors.white
      );
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<NavigationIconView> _navigationViews;

  void initState() {
    super.initState();
    print(Constants.IconFontFamily);
    _navigationViews = [
      NavigationIconView(
          title: '微信',
          icon: IconData(
              0xe600,
              fontFamily: Constants.IconFontFamily
          ),
          activeIcon: IconData(
              0xe61b,
              fontFamily: Constants.IconFontFamily
          ),
      ),
      NavigationIconView(
          title: '通讯录',
          icon: IconData(
              0xe655,
              fontFamily: Constants.IconFontFamily
          ),
          activeIcon: IconData(
              0xe6c2,
              fontFamily: Constants.IconFontFamily
          ),
      ),
      NavigationIconView(
          title: '发现',
          icon: IconData(
              0xe636,
              fontFamily: Constants.IconFontFamily
          ),
          activeIcon: IconData(
              0xe6c6,
              fontFamily: Constants.IconFontFamily
          ),
      ),
      NavigationIconView(
          title: '我的',
          icon: IconData(
              0xe67b,
              fontFamily: Constants.IconFontFamily
          ),
          activeIcon: IconData(
              0xe62d,
              fontFamily: Constants.IconFontFamily
          ),
      ),
    ];
  }

  _buildPopupMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(IconData(
            iconName,
            fontFamily: Constants.IconFontFamily,
        ), color: Colors.black54),
        Container(width: 10,),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        print('点击第$index个tab');
      },
    );

    return Scaffold(
      appBar: AppBar(
          title: Text('微信'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {print('点击搜索');},
            ),

            PopupMenuButton(
              itemBuilder: (BuildContext context){
                return <PopupMenuItem<ActionItems>>[
                  PopupMenuItem(
                    child: _buildPopupMenuItem(0xe61b, '发起群聊'),
                    value: ActionItems.GROUP_CHAT,
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem(0xe618, '添加朋友'),
                    value: ActionItems.ADD_FRIEND,
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem(0xe638, '扫一扫'),
                    value: ActionItems.QR_SCAN,
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem(0xe637, '收付款'),
                    value: ActionItems.PAYMENT,
                  ),
                ];
              },
              icon: Icon(Icons.add),
              onSelected: (ActionItems selectedType) {
                print('selectedStr = $selectedType');
              },
            ),
          ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Icon(IconData(0xe61b, fontFamily:Constants.IconFontFamily)),
            Text('dat2a'),
          ],
        ),
      ),
      bottomNavigationBar: botNavBar,
    );
  }

}
