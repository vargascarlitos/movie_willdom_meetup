import 'package:flutter/material.dart';
import 'environment.dart';

class EnvironmentConfig {
  final Flavor flavor;
  final EnvironmentValue environmentValue;
  final BannerLocation? bannerLocation;

  static EnvironmentConfig? _instance;

  factory EnvironmentConfig({
    required Flavor flavor,
    required EnvironmentValue environmentValue,
    required BannerLocation? bannerLocation,
  }) {
    _instance ??= EnvironmentConfig._internal(flavor, environmentValue, bannerLocation);
    return _instance!;
  }

  EnvironmentConfig._internal(this.flavor, this.environmentValue, this.bannerLocation);

  static EnvironmentConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance?.flavor == Flavor.prod;

  static bool isQA() => _instance?.flavor == Flavor.qa;

  static bool isDev() => _instance?.flavor == Flavor.dev;
}
