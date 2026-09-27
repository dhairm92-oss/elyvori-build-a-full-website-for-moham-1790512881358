import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter & Dart',
      'Node.js & Express',
      'PostgreSQL & Databases',
      'RESTful APIs',
      'Docker & DevOps',
      'Git & GitHub',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      color: const Color(0xFF1E293B),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    '01.',
                    style: TextStyle(color: Color(0xFF38BDF8), fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'About Me',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Hello! I\'m Mohammed Dhair, a software engineer who loves turning complex problems into elegant, maintainable, and high-performance applications. My journey in tech started with a deep curiosity about how things work under the hood, leading me to master both frontend user interfaces and resilient backend databases.',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 16),
              const Text(
                'Here are a few technologies I\'ve been working with recently:',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: skills
                    .map((skill) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.arrow_right, color: Color(0xFF38BDF8)),
                            Text(
                              skill,
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
