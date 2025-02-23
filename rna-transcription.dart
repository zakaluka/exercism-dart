class RnaTranscription {
  String toRna(String input) {
    return input.split('').map((el) {
      if (el == 'G')
        return 'C';
      else if (el == 'C')
        return 'G';
      else if (el == 'T')
        return 'A';
      else if (el == 'A')
        return 'U';
      else
        throw UnimplementedError();
    }).join();
  }
}
