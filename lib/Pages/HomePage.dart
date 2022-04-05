// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:guven_future/Widgets/CustomAppBar.dart';
import 'package:guven_future/Widgets/CustomDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
