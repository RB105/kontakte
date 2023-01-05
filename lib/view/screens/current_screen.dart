import 'package:flutter/material.dart';
import 'package:kontakte/view/pages/home_page.dart';
import 'package:kontakte/view/pages/setting_page.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_bottom_navigation.dart';
import '../../provider/provider_theme_change.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({super.key});

  @override
  State<CurrentScreen> createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  final List<Widget> pages = [const HomePage(), const SettingsPage()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeThemeProvider())
      ],
      builder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.black,
            currentIndex:
                _currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            ],
            onTap: onTabTapped,
          ),
        );
      },
    );
  }
 void onTabTapped(int index) {
     setState(() {
     _currentIndex = index;
     });
   }
  }
