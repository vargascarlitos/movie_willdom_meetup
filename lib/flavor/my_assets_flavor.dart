import 'environment_config.dart';
import 'flavor.dart';

class MyAssets {
  static String getImage(String imagePath) {
    final flavor = EnvironmentConfig.instance.flavor;

    switch (flavor) {
      case Flavor.dev:
      // Return the Rick and Morty image for development flavor from assets/dev/
        return 'assets/dev/rick_morty_default.jpg';
      case Flavor.qa:
      // Return the requested image with a QA banner overlay for QA flavor from assets/qa/
        return imagePath.replaceFirst('assets/images/', 'assets/qa/');
      case Flavor.prod:
      default:
      // Return the requested image for production flavor
        return imagePath;
    }
  }
}