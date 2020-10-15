import 'dart:math';

class ColorRandomizer {

  /// Returns the value of alpha and RGB channels respectively
  List<int> getRandomARGB() {

    var random_value = new Random();
    List<int> colors = [];

    ///We don't want the colors to be saturated very often, so
    ///there is always (base value + random value) of alpha channel
    colors.add(100+ random_value.nextInt(155));

    for (int i = 0; i < 3; i++) colors.add(random_value.nextInt(255));

    return colors;
  }

}