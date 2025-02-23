class Node {
  String data;
  Node? left;
  Node? right;

  Node(String data)
      : data = data,
        left = null,
        right = null;

  Node insert(String x) {
    if (x.compareTo(data) <= 0) {
      if (left == null)
        left = Node(x);
      else
        left!.insert(x);
    } else if (x.compareTo(data) > 0) {
      if (right == null)
        right = Node(x);
      else
        right!.insert(x);
    }
    return this;
  }

  List<String> getData(List<String> accum) {
    left?.getData(accum);
    accum.add(data);
    right?.getData(accum);
    return accum;
  }
}

class BinarySearchTree {
  Node root;

  BinarySearchTree(String x) : root = Node(x);

  BinarySearchTree insert(String x) {
    root.insert(x);
    return this;
  }

  List<String> get sortedData {
    return root.getData([]);
  }
}
