import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToSection(int index) {
    // Approximate offsets or use GlobalKeys for precise scrolling
    double offset = 0;
    if (index == 0) {
      offset = 0;
    } else if (index == 1) {
      offset = 700;
    } else if (index == 2) {
      offset = 1400;
    } else if (index == 3) {
      offset = 2400;
    }

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: Navbar(onNavTap: _scrollToSection),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(onExplorePressed: () => _scrollToSection(2)),
            const AboutSection(),
            const ProjectsSection(),
            const ContactSection(),
            Container(
              padding: const EdgeInsets.all(24.0),
              color: const Color(0xFF0F172A),
              child: const Center(
                child: Text(
                  'Designed & Built by Mohammed Dhair',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
