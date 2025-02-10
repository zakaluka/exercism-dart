class SpaceAge {
  Map<String, double> multiplier = {
    'Mercury': 0.2408467,
    'Venus': 0.61519726,
    'Earth': 1.0,
    'Mars': 1.8808158,
    'Jupiter': 11.862615,
    'Saturn': 29.447498,
    'Uranus': 84.016846,
    'Neptune': 164.79132,
  };

  int earthseconds = 31557600;

  double age({required String planet, required int seconds}) {
    double mult = multiplier[planet]!;

    return double.parse((seconds / earthseconds / mult).toStringAsFixed(2));
  }
}
