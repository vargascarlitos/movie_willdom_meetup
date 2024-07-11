import 'package:flutter/material.dart';

class ErrorLog {
  final String message;
  final String stackTrace;
  final DateTime timestamp;

  ErrorLog({required this.message, required this.stackTrace, required this.timestamp});
}

class ErrorsPage extends StatefulWidget {
  const ErrorsPage({Key? key}) : super(key: key);

  static const routeName = '/errors';

  @override
  _ErrorsPageState createState() => _ErrorsPageState();
}

class _ErrorsPageState extends State<ErrorsPage> {
  List<ErrorLog> errors = [
    ErrorLog(
      message: "NullPointerException",
      stackTrace: "This is a simulated stack trace from a backend call.",
      timestamp: DateTime.now(),
    ),
  ];

  void _loadMoreErrors() {
    // Simulate loading more errors
    setState(() {
      errors.add(
        ErrorLog(
          message: "Another Exception",
          stackTrace: "Another simulated stack trace.",
          timestamp: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error Logs'),
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
                title: Text(error.message),
                content: SingleChildScrollView(
                  child: Text(error.stackTrace),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _loadMoreErrors,
        child: Icon(Icons.refresh),
      ),
    );
  }
}