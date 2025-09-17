import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display Image And Personal Info')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: PersonalInfo(),
              ),
              Image.asset('assets/images/pfp.jpg'),
              Image.asset('assets/images/car.jpg'),
              Image.asset('assets/images/dawg in him.jpg'),
              Image.asset('assets/images/meme.jpg'),
              Image.asset('assets/images/miku.png'),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Personal Information'),
        InfoRow(label: 'Name', value: 'DARWIN CATBAGAN'),
        InfoRow(label: 'Age', value: '19'),
        InfoRow(label: 'Location', value: 'SAN JUAN LA UNION'),
        InfoRow(label: 'Email', value: 'darwin.catbagan@lorma.edu'),
        InfoRow(label: 'Contact', value: '09467654213'),
        SizedBox(height: 24),
        SectionHeader(title: 'Education'),
        InfoRow(label: 'Course', value: 'Information Technology-II'),
        InfoRow(
            label: 'College',
            value:
            'Central for Learning and Innovation Lorma Colleges San Juan La Union'),
        InfoRow(label: 'Year', value: '2025-2026'),
        SizedBox(height: 24),
        SectionHeader(title: 'Skills'),
        InfoRow(label: 'Programming', value: 'Java'),
        InfoRow(label: 'Web Development', value: 'HTML, CSS'),
        InfoRow(label: 'Others', value: 'MySQL, Git'),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
