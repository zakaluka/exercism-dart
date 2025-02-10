enum Classification { equal, sublist, superlist, unequal }

class Sublist {
  Classification sublist(List<int> one, List<int> two) {
    var sone = ' ' + one.join(' ') + ' ';
    var stwo = ' ' + two.join(' ') + ' ';

    if (one.length == 0 && two.length > 0)
      return Classification.sublist;
    else if (one.length > 0 && two.length == 0)
      return Classification.superlist;
    else if (sone == stwo)
      return Classification.equal;
    else if (sone.contains(stwo))
      return Classification.superlist;
    else if (stwo.contains(sone))
      return Classification.sublist;
    else
      return Classification.unequal;
  }
}
