
import 'package:capi/Side_Menu/menu_widget.dart';
import 'package:flutter/material.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Colors.black, fontFamily: "Comfort"),),

        centerTitle: true,
        leading: MenuWidget(),
        backgroundColor: Color(0xFFFAFAFA),
      ),

    );
  }
}