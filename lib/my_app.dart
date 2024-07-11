import 'package:flutter/material.dart';
import 'package:movie_willdom_meetup/flavor/flavor_banner.dart';
import 'package:movie_willdom_meetup/models/flutter_error_logs.dart';
import 'package:movie_willdom_meetup/pages/device_info_page.dart';
import 'package:movie_willdom_meetup/pages/error_flutter_page.dart';
import 'package:movie_willdom_meetup/pages/error_page.dart';
import 'package:movie_willdom_meetup/pages/flavor_info_page.dart';
import 'package:movie_willdom_meetup/pages/movie_page.dart';
import 'package:movie_willdom_meetup/pages/ui_kit_page.dart';
import 'package:movie_willdom_meetup/pages/utilities_pages.dart';

class MyApp extends StatefulWidget {
  MyApp({this.errorLogs, super.key});

  List<FlutterErrorLog>? errorLogs;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const FlavorBanner(
              pageWidget: MoviePage(),
            ),
        UtilitiesPages.routeName: (context) => const FlavorBanner(
              pageWidget: UtilitiesPages(),
            ),
        DeviceInfoPage.routeName: (context) => const FlavorBanner(
              pageWidget: DeviceInfoPage(),
            ),
        UIKitPage.routeName: (context) => const FlavorBanner(
              pageWidget: UIKitPage(),
            ),
        ErrorsPage.routeName: (context) => const FlavorBanner(
              pageWidget: ErrorsPage(),
            ),
        ErrorsFlutterPage.routeName: (context) => FlavorBanner(
              pageWidget: ErrorsFlutterPage(
                errors: widget.errorLogs ?? [],
              ),
            ),
        FlavorInfoPage.routeName: (context) => const FlavorBanner(
              pageWidget: FlavorInfoPage(),
            ),
      },
    );
  }
}
