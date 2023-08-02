import 'package:bloc_simple_posts/app/app_strings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.home),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: [
            const Text('العربية'),
            Switch(
              value: false,
              onChanged: (v) {},
            ),
            const Text('English'),
          ],
        ),
      ),
    );
  }
}
