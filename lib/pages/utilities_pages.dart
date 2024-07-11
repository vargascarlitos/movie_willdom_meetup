import 'package:flutter/material.dart';

class UtilitiesPages extends StatelessWidget {
  const UtilitiesPages({super.key});

  static const routeName = '/utilities';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utilidades'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/device_info');
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_android),
                  Text('Device Info'),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/ui_kit');
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.design_services),
                  Text('UI Kit'),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/errors');
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list),
                  Text('Logs'),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/errors_flutter');
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error),
                  Text('Errors'),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/events');
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.event),
                  Text('Events'),
                ],
              ),
            ),
          ),
          // flavor info
          Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/flavor_info');
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info),
                  Text('Flavor Info'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
