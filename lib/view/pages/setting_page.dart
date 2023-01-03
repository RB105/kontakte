import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/current_them_mode.dart';
import '../../provider/provider_theme_change.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ChangeThemeProvider(),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: CurrentThemMode.scaffoldColor,
            body: SafeArea(
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: const Text(
                        "Dark theme",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                      trailing: Switch.adaptive(
                          value:
                              context.watch<ChangeThemeProvider>().isDarkMode,
                          onChanged: (v) {
                            context.read<ChangeThemeProvider>().changeTheme();
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ]);
  }
}