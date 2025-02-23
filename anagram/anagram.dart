import 'package:collection/collection.dart';

class Anagram {
  List<String> findAnagrams(String s, List<String> candidates) {
    var sList = s.toUpperCase().split('');
    sList.sort();

    return candidates
        .where((el) => el.toUpperCase() != s.toUpperCase())
        .where((el) => el.length == s.length)
        .where((el) {
      var elx = el.toUpperCase().split('');
      elx.sort();
      return ListEquality().equals(elx, sList);
    }).toList();
  }
}
