class Forth {
  // main stack
  final List<int> stack = [];

  // user-defined keywords
  final Map<String, List<String>> substitutions = {};

  // built-in keywords
  final List<String> keywords = ['DUP', 'DROP', 'SWAP', 'OVER'];

  // built-in operations
  final List<String> operations = ['+', '-', '*', '/'];

  List<String> runDownSub(String s) {
    if (substitutions.containsKey(s)) {
      List<String> x = [];

      for (var el in substitutions[s]!) {
        x.addAll(runDownSub(el));
      }
      return x;
    } else
      return [s];
  }

  void evaluate(String instr) {
    // Parse the entry
    List<String> parsedList =
        instr.toUpperCase().split(' ').where((x) => x != '').toList();

    // Handle instructions separately.
    if (parsedList.length > 0 && parsedList[0] == ':') {
      if (parsedList.length < 4) throw Exception('Invalid definition');

      // Numbers cannot be redefined.
      if (int.tryParse(parsedList[1]) != null)
        throw Exception('Invalid definition');

      // Remove the colon and the final semicolon.
      parsedList = parsedList.sublist(1, parsedList.length - 1);

      // Add entry to 'substitutions'
      List<String> x = [];
      for (var p in parsedList.sublist(1)) {
        x.addAll(runDownSub(p));
      }
      substitutions.addEntries([MapEntry(parsedList[0], x)]);
    } else {
      // Use the list as a queue, the end of the list is the "head" of the queue
      var pl = parsedList.reversed.toList();
      while (pl.length > 0) {
        // Get the first entry and remove it from the list.
        String p = pl.removeLast();

        if (substitutions.containsKey(p)) {
          // Found a substitution, add instructions into pl at the front.
          substitutions[p]?.reversed.forEach((v) => pl.add(v));
        } else if (keywords.contains(p)) {
          // Basic instructions, default behavior.
          if (p == 'DUP') {
            if (stack.length < 1) throw Exception('Stack empty');

            stack.add(stack.last);
          } else if (p == 'DROP') {
            if (stack.length < 1) throw Exception('Stack empty');

            stack.removeLast();
          } else if (p == 'SWAP') {
            if (stack.length < 2) throw Exception('Stack empty');

            var num1 = stack.removeLast();
            var num2 = stack.removeLast();

            stack.add(num1);
            stack.add(num2);
          } else if (p == 'OVER') {
            if (stack.length < 2) throw Exception('Stack empty');

            stack.add(stack[stack.length - 2]);
          }
        } else if (operations.contains(p)) {
          // Basic math operations.
          if (stack.length < 2) throw Exception('Stack empty');

          var num1 = stack.removeLast();
          var num2 = stack.removeLast();

          if (p == '/') {
            if (num1 == 0) throw Exception('Division by zero');

            stack.add((num2 / num1).toInt());
          } else if (p == '*') {
            stack.add(num2 * num1);
          } else if (p == '+') {
            stack.add(num2 + num1);
          } else if (p == '-') {
            stack.add(num2 - num1);
          } else {
            throw Exception('wtf');
          }
        } else {
          // Seems like a number, but is it a number?  No.
          if (int.tryParse(p) == null) throw Exception('Unknown command');

          // Should be a number.
          stack.add(int.parse(p));
        }

        // Debug
        // print(p + " | " + stack.toString());
      }
    }
  }
}
