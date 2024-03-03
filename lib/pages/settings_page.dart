import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings", style: TextStyle(fontSize: 32)),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          const Text("DISPLAY OPTIONS"),
          Row(
            children: [
              Text("Units"),
            ],
          ),
          Row(
            children: [
              Text("Appearance"),
            ],
          ),
        ],
      ),
    );
  }
}
