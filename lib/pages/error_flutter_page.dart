import 'package:flutter/material.dart';
import 'package:movie_willdom_meetup/models/flutter_error_logs.dart';

class ErrorsFlutterPage extends StatelessWidget {
  final List<FlutterErrorLog> errors;

  static const routeName = '/errors_flutter';

  const ErrorsFlutterPage({super.key, required this.errors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Errors'),
      ),
      body: ListView.builder(
        itemCount: errors.length,
        itemBuilder: (context, index) {
          final error = errors[index];
          return ListTile(
            title: Text(error.message),
            subtitle: Text("${error.timestamp}"),
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Error Details'),
                content: SingleChildScrollView(
                  child: Text('${error.stackTrace}'),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Close'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}