import 'package:flutter/material.dart';
import 'package:movie_willdom_meetup/flavor/environment_config.dart';

class FlavorInfoPage extends StatelessWidget {
  const FlavorInfoPage({super.key});

  static const String routeName = '/flavor_info';

  @override
  Widget build(BuildContext context) {
    final flavor = EnvironmentConfig.instance.flavor;
    final baseUrl = EnvironmentConfig.instance.environmentValue.baseUrl;
    final serverSelect = EnvironmentConfig.instance.environmentValue.serverSelect;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flavor Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flavor: ${flavor.name}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Base URL: $baseUrl',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Server Select: $serverSelect',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}