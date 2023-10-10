import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  String menuTitle;
  IconData menuIcon;
  Function menuFunction;

  MenuItem(this.menuTitle, this.menuIcon, this.menuFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(menuIcon),
      title: Text(menuTitle),
      onTap: () => menuFunction()
    );
  }
}
