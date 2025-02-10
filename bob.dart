class Bob {
  String response(String s) {
    s = s.trim();
    var allCaps = s.toUpperCase();
    var hasLetters = s.contains(RegExp('[a-zA-Z]'));

    if (s == allCaps && s.endsWith('?') && hasLetters)
      return "Calm down, I know what I'm doing!";
    else if (s == allCaps && hasLetters)
      return "Whoa, chill out!";
    else if (s.endsWith('?'))
      return "Sure.";
    else if (s.replaceAll(RegExp(r'\s*'), '') == '')
      return "Fine. Be that way!";
    else
      return "Whatever.";
  }
}
