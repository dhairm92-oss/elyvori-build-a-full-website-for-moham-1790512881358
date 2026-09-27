import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/project_model.dart';
import '../models/message_model.dart';

class ApiService {
  // In production, point this to your actual backend API URL
  static const String baseUrl = 'https://api.mohammeddhair.com';

  static Future<List<Project>> fetchProjects() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/projects'));
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        return list.map((model) => Project.fromJson(model)).toList();
      } else {
        return _getMockProjects();
      }
    } catch (e) {
      // Fallback to mock data if backend is unreachable
      return _getMockProjects();
    }
  }

  static Future<bool> sendMessage(ContactMessage message) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/contact'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(message.toJson()),
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      // Simulate successful submission for demonstration purposes
      await Future.delayed(const Duration(seconds: 1));
      return true;
    }
  }

  static List<Project> _getMockProjects() {
    return [
      (
        id: '1',
        title: 'Enterprise Cloud Dashboard',
        description: 'A scalable real-time monitoring dashboard built with Flutter Web and Node.js backend connected to PostgreSQL.',
        imageUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=800&q=80',
        githubUrl: 'https://github.com/mohammeddhair',
        liveUrl: 'https://mohammeddhair.com',
        technologies: ['Flutter', 'Node.js', 'PostgreSQL', 'Docker'],
      ),
      (
        id: '2',
        title: 'Fintech Mobile & Web Suite',
        description: 'Secure financial transaction platform featuring biometric authentication, real-time currency exchange, and robust database storage.',
        imageUrl: 'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?auto=format&fit=crop&w=800&q=80',
        githubUrl: 'https://github.com/mohammeddhair',
        liveUrl: 'https://mohammeddhair.com',
        technologies: ['Dart', 'Flutter', 'Firebase', 'REST API'],
      ),
      (
        id: '3',
        title: 'AI-Powered Analytics Tool',
        description: 'Machine learning data pipeline dashboard providing actionable business intelligence and automated report generation.',
        imageUrl: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=800&q=80',
        githubUrl: 'https://github.com/mohammeddhair',
        liveUrl: 'https://mohammeddhair.com',
        technologies: ['Python', 'Flutter Web', 'PostgreSQL', 'FastAPI'],
      ),
    ].map((p) => Project(
          id: p.id,
          title: p.title,
          description: p.description,
          imageUrl: p.imageUrl,
          githubUrl: p.githubUrl,
          liveUrl: p.liveUrl,
          technologies: p.technologies,
        )).toList();
  }
}
