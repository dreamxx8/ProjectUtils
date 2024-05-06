import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_browser/page_custom_widget/custom_widget_page.dart';
import 'package:image_browser/page_image_manager/image_browser_page.dart';
import 'package:image_browser/page_utils_method/utils_method_page.dart';


class MainPage extends StatefulWidget {
  static const String routeName = "MainPage";

  static void start(BuildContext context) {
    Navigator.pushNamed(context, routeName);
  }

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with _MainPageBloc {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      _isInitialized = true;
      _init();
    }
    return CupertinoTabScaffold(
      tabBar: _cupertinoTabBar(),
      tabBuilder: (context, index) {
        return _pages[index];
      },
    );
  }

  CupertinoTabBar _cupertinoTabBar() {
    return CupertinoTabBar(
      // 点击回调
      onTap: (index) {
        print(index);
      },
      // 设置默认选中位置
      currentIndex: 0,
      // tabbar 背景色
      backgroundColor: Colors.white,
      // 图标高亮颜色
      activeColor: Colors.deepPurple,
      // 图标未选中颜色
      inactiveColor: Colors.grey,
      // 图标大小
      iconSize: 25,
      // 边框
      border: Border(
        top: BorderSide(width: 1, color: Colors.black.withOpacity(0.05)),
      ),
      items: [
        _bottomNavigationBarItem(CupertinoIcons.home, "首页"),
        _bottomNavigationBarItem(CupertinoIcons.arrow_3_trianglepath, "组件"),
        _bottomNavigationBarItem(CupertinoIcons.app_badge, "图片"),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(IconData activeIcon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(activeIcon), // 图标
      activeIcon: Icon(activeIcon), // 高亮图标
      label: title, // 标题
      backgroundColor: const Color(0xFFFAFAFA), // 背景色，仅在 BottomNavigatinBar 中生效，在 iOS 风格组件中无效
    );
  }
}

mixin _MainPageBloc on State<MainPage> {
  bool _isInitialized = false;

  /// 当前页面下标
  int _currentIndex = 0;

  late Widget _currentPage;

  late List<Widget> _pages;

  _init() {
    _pages = [
      // const HomePage(),
      UtilsMethodPage(),
      CustomWidgetPage(),
      ImageBrowserPage(),

    ];
    _currentPage = _pages[_currentIndex];
  }
}
