import 'package:flutter/material.dart';

class UIPage extends StatelessWidget {
  const UIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("UI"),
      ),
    );
  }
}
