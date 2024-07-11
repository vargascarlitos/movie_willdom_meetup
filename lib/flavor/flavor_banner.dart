import 'package:flutter/material.dart';
import 'package:movie_willdom_meetup/flavor/environment_config.dart';
import 'package:movie_willdom_meetup/pages/flavor_info_page.dart';
import 'package:movie_willdom_meetup/pages/utilities_pages.dart';

class FlavorBanner extends StatelessWidget {
  final Widget pageWidget;

  const FlavorBanner({super.key, required this.pageWidget});

  @override
  Widget build(BuildContext context) {
    return EnvironmentConfig.isProduction()
        ? pageWidget
        : GestureDetector(
            onTap: () {
              EnvironmentConfig.isDev()
                  ? Navigator.of(context).pushNamed(FlavorInfoPage.routeName)
                  : Navigator.of(context).pushNamed(UtilitiesPages.routeName);
            },
            child: Banner(
              location: EnvironmentConfig.instance.bannerLocation!,
              message:
                  EnvironmentConfig.instance.flavor.toString().split('.').last,
              color: EnvironmentConfig.isDev()
                  ? Colors.red
                  : EnvironmentConfig.isQA()
                      ? Colors.blue
                      : Colors.green,
              child: pageWidget,
            ),
          );
  }
}
