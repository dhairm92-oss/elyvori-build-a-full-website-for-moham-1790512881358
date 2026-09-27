import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavTap;

  const Navbar({Key? key, required this.onNavTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0F172A),
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => onNavTap(0),
                child: const Text(
                  'Mohammed Dhair',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                _navItem('Home', 0),
                _navItem('About', 1),
                _navItem('Projects', 2),
                _navItem('Contact', 3),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title, int index) {
    return TextButton(
      onPressed: () => onNavTap(index),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF94A3B8),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
