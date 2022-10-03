import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/cart_screen/cart_screen.dart';
import 'package:malina_app/screens/feed_screen/feed_screen.dart';
import 'package:malina_app/screens/main_screens/categories_screen/categories_screen.dart';
import 'package:malina_app/screens/profile_screen/profile_screen.dart';

class ExampleScreen extends StatefulWidget {
  final int currentIndex;
  const ExampleScreen({super.key, required this.currentIndex});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const FeedScreen(),
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  void _onItemTapped(int index) {
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
            NavigatorPage(
              child: Text('Home'),
            ),
            NavigatorPage(
              child: Text('Business'),
            ),
            NavigatorPage(
              child: Text('Technology'),
            ),
            NavigatorPage(
              child: Text('Education'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'Technology',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Education',
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
    );
  }

  Widget itemIcon(bool isState, String iconName, String labelText) {
    return Material(
      child: Column(
        children: [
          Container(
            height: 1.5.h,
            width: 35.w,
            color: isState ? ThemeHelper.crimson : Colors.transparent,
          ),
          SizedBox(height: 8.h),
          ImageIcon(
            AssetImage(iconName),
            color: isState ? ThemeHelper.crimson : ThemeHelper.greyDial,
          ),
          SizedBox(height: 3.h),
          Text(
            labelText,
            style: isState
                ? TextStyleHelper.seletedLabel
                : TextStyleHelper.unseletedLabel,
          ),
        ],
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
