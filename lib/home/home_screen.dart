import 'package:flutter/material.dart';
import '../consts.dart' show Constants, AppColors;

// 定义枚举
enum ActionItems {
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
}

// 抽出一个类, 用于构造BottomNavigationBarItem
class NavigationIconView {
  final BottomNavigationBarItem item;
  // 构造函数, 用于创建 BottomNavigationBarItem 中的title, icon
  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}):
      item = BottomNavigationBarItem(
        icon: Icon(icon),
        activeIcon: Icon(activeIcon),
        title: Text(title),
        backgroundColor: Colors.white
      );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _pageController;
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;

  void initState() {
    super.initState();
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
    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      Container(color: Colors.red,),
      Container(color: Colors.yellow,),
      Container(color: Colors.greenAccent,),
      Container(color: Colors.purple,),
    ];
  }

  _buildPopupMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(IconData(
            iconName,
            fontFamily: Constants.IconFontFamily,
        ), color: AppColors.AppBarPopupMenuColor),
        Container(width: 10,),
        Text(title, style: TextStyle(color: AppColors.AppBarPopupMenuColor)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: AppColors.TabIconActiveColor,
      items: _navigationViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        print('点击第$index个tab');
        setState(() { // 重绘widget
          _currentIndex = index;
          //_pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          _pageController.jumpToPage(_currentIndex);
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
          title: Text('微信'),
          elevation: 0.0, // 去掉navBar下面的阴影
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
      body: PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _pages[index];
          },
          controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
            print(index);
            setState(() {
              _currentIndex = index;
            });
        },
      ),
      bottomNavigationBar:botNavBar
    );
  }

}
