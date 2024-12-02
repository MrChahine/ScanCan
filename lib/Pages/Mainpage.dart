import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scancan/Pages/Camera.dart';
import 'package:scancan/Pages/Folder.dart';
import 'package:scancan/Pages/Home.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedIndex = 0;
  final File? image = null;

  static final List<Widget> _screens = [const Home(), const FolderScreen()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavBarItem(CupertinoIcons.home, "Home", 0),
              buildNavBarItem(CupertinoIcons.folder, "Folder", 1),
            ],
          ),
        ),
        floatingActionButton: ClipOval(
          child: Material(
            color: Colors.purple[300],
            child: InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CameraScreen(),
                  ),
                );
              },
              child: const SizedBox(
                width: 56,
                height: 56,
                child: Icon(
                  CupertinoIcons.camera,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          icon,
          color: _selectedIndex == index ? Colors.blue[300] : Colors.black,
        ),
        Text(
          label,
          style: TextStyle(
            color: _selectedIndex == index ? Colors.blue[300] : Colors.black,
          ),
        )
      ]),
    );
  }
}
