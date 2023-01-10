import 'package:flutter/material.dart';
import 'package:kontakte/view/pages/bottom_navigation_pages/chat_page.dart';

import 'package:provider/provider.dart';

import '../../provider/provider_theme_change.dart';
import '../pages/bottom_navigation_pages/home_page.dart';
import '../pages/bottom_navigation_pages/setting_page.dart';
import '../pages/bottom_navigation_pages/user_list_page.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({super.key});

  @override
  State<CurrentScreen> createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  final List<Widget> _pages = [const HomePage(),const UserListPage(), const ChatPage(),const SettingsPage()];
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
          body: _pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.black,
            currentIndex:
                _currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outlined), label: ""),
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
