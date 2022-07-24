import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final void Function(bool)? onChangedDarkMode;
  final bool darkMode;

  const HomeDrawer({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.onChangedDarkMode,
    required this.darkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://picsum.photos/200',
                ),
              ),
              accountName: Text(
                userName,
              ),
              accountEmail: Text(
                userEmail,
              ),
            ),
          ),
          SwitchListTile(
            title: Text('menu_dark_mode_option'.tr),
            value: darkMode,
            onChanged: onChangedDarkMode,
          ),
        ],
      ),
    );
  }
}
