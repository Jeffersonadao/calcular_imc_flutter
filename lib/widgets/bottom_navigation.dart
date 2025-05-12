import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final PageController controller;

  const BottomNavigation({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        controller.jumpToPage(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calcular'),
        BottomNavigationBarItem(
          icon: Icon(Icons.storage_rounded),
          label: 'Histórico',
        ),
      ],
    );
  }
}
