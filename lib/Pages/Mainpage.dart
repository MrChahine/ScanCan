import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    const HistoryScreen(),
    const FolderScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom"),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(CupertinoIcons.list_bullet, "History", 0),
            buildNavBarItem(CupertinoIcons.folder, "Folder", 1),
          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: Colors.purple[300],
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CameraScreen()),
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
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          icon,
          color: _selectedIndex == index ? Colors.purple[300] : Colors.black,
        ),
        Text(
          label,
          style: TextStyle(
            color: _selectedIndex == index ? Colors.purple[300] : Colors.black,
          ),
        )
      ]),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("History Screen"),
    );
  }
}

class FolderScreen extends StatelessWidget {
  const FolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Folder Screen"),
    );
  }
}

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is the Camera Screen"),
      ),
    );
  }
}
