import 'package:flutter/material.dart';
import 'package:frontend/ui/ar_camera.dart';
import 'package:frontend/ui/settings.dart';
import 'package:frontend/ui/home.dart';

class CustomBottomBarWidget extends StatefulWidget {
  const CustomBottomBarWidget({super.key});

  @override
  CustomBottomBarWidgetState createState() => CustomBottomBarWidgetState();
}

class CustomBottomBarWidgetState extends State<CustomBottomBarWidget> {
  final GlobalKey<ScaffoldState> _bottomBarKey = GlobalKey<ScaffoldState>();

  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(1);
  final List<Widget> _actualScreens = [
    const ArCamera(),
    const Home(),
    const Settings(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndex,
      builder: (context, value, child) {
        return Scaffold(
          key: _bottomBarKey,
          body: IndexedStack(
            index: _selectedIndex.value,
            children: _actualScreens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex.value,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt),
                label: 'Fotocamera',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Impostazioni',
              ),
            ],
          ),
        );
      },
    );
  }
}