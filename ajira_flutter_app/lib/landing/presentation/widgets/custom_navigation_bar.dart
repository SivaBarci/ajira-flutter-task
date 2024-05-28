import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  const CustomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Your library",
            tooltip: "Your library"),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_post_office),
            label: "Your posts",
            tooltip: "Your posts"),
      ],
    );
  }
}
