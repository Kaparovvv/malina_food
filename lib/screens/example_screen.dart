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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: itemIcon(true, IconHelper.cartIcon, 'BAsket'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: itemIcon(true, IconHelper.cartIcon, 'BAsket'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: itemIcon(true, IconHelper.cartIcon, 'BAsket'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: itemIcon(true, IconHelper.cartIcon, 'BAsket'),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
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
