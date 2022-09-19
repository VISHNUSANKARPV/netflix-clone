import 'package:flutter/material.dart';

ValueNotifier<int> indexchangingNotifier = ValueNotifier(0);

class BottumNavWidgets extends StatelessWidget {
  const BottumNavWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexchangingNotifier,
      builder: (BuildContext context, int newIndex, Widget? child) {
        return BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexchangingNotifier.value = index;
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: 'new&hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: 'Fast&laughs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_circle_down_rounded),
                  label: 'Downloads'),
            ]);
      },
    );
  }
}
