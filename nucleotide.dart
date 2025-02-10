// Implement a custom InvalidNucleotideException exception
class InvalidNucleotideException implements Exception {}

class NucleotideCount {
  Map<String, num> count(String s) {
    return s.toUpperCase().split('').fold({'A': 0, 'C': 0, 'G': 0, 'T': 0},
        ((acc, e) {
      if (acc[e] != null) {
        return acc.map((k, v) => MapEntry(k, k == e ? v + 1 : v));
      } else {
        throw InvalidNucleotideException();
      }
    }));
  }
}
