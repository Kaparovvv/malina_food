import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';
import 'package:malina_app/screens/cart_screen/cart_screen.dart';
import 'package:malina_app/screens/feed_screen/feed_screen.dart';
import 'package:malina_app/screens/main_screens/categories_screen/categories_screen.dart';
import 'package:malina_app/screens/profile_screen/profile_screen.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/qr_code_scanner_screen.dart';

class NavBarWidget extends StatefulWidget {
  final int currentIndex;
  const NavBarWidget({super.key, required this.currentIndex});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: const [
            FeedScreen(),
            QrCodeScannerScreen(),
            CategoriesScreen(),
            CartScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ThemeHelper.navBarShadow,
            blurRadius: 30.r,
            offset: const Offset(15, 0),
          )
        ]),
        child: BottomNavigationBar(
          backgroundColor: ThemeHelper.white,
          selectedItemColor: ThemeHelper.crimson,
          unselectedIconTheme: IconThemeData(color: ThemeHelper.color7a7a7a),
          selectedLabelStyle: TextStyleHelper.seletedLabel,
          unselectedLabelStyle: TextStyleHelper.unseletedLabel,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: WidgetsHelpers().logoIcon(IconHelper.feedIcon),
              label: 'Лента',
            ),
            BottomNavigationBarItem(
              icon: WidgetsHelpers().logoIcon(IconHelper.qrCodeIcon),
              label: 'QR-code',
            ),
            BottomNavigationBarItem(
              icon: itemIcon(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: WidgetsHelpers().logoIcon(IconHelper.cartIcon),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: WidgetsHelpers().logoIcon(IconHelper.profileIcon),
              label: 'Профиль',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(
              () {
                _selectedIndex = index;
              },
            );
          },
        ),
      ),
    );
  }

  Widget itemIcon() {
    return Container(
      width: 46.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: ThemeHelper.crimson,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: ThemeHelper.rgb170,
            offset: const Offset(0, 0),
            blurRadius: 10.r,
          ),
        ],
      ),
      child: ImageIcon(
        AssetImage(IconHelper.mainScreenIcon),
        size: 25,
        color: ThemeHelper.white,
      ),
    );
  }
}

class NavigatorPage extends StatefulWidget {
  final Widget child;
  const NavigatorPage({super.key, required this.child});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  late TextEditingController _textEditingController;
  int _currentRoute = 0;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: widget.child,
                  centerTitle: true,
                ),
                body: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: ListView(
                    children: List.generate(
                      50,
                      (index) {
                        return Card(
                          child: ListTile(
                            leading: FlutterLogo(),
                            title: Text('${index + 1} Item'),
                            enabled: true,
                            onTap: () {
                              if (_currentRoute != index) {
                                _textEditingController =
                                    TextEditingController();
                              }
                              _currentRoute = index;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return DetailRoute(
                                      textEditingController:
                                          _textEditingController,
                                      index: index,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}

class DetailRoute extends StatelessWidget {
  const DetailRoute({super.key, this.textEditingController, this.index});

  final TextEditingController? textEditingController;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route for $index Item'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: TextField(controller: textEditingController),
      ),
    );
  }
}
