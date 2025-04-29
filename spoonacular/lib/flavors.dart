enum Flavor {
  dev,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Spoonacular Dev';
      case Flavor.prod:
        return 'Spoonacular';
    }
  }

}
