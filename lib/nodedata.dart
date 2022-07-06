class NodeData {
  static final List<String> nodeList = [
    'lecture hall 1',
    'lecture hall 2',
    'hall 1',
    'hall 2',
    'hall 3',
    'hall 4',
    'hall 5',
    'lab 1',
    'lab 2',
    'lab 3',
    'lab 4',
    'lab 5',
    'lab 6',
    'student affairs',
  ];

  static List<String> getSuggestions(String query) =>
      List.of(nodeList).where((node) {
        final nodeLower = node.toLowerCase();
        final queryLower = query.toLowerCase();
        return nodeLower.contains(queryLower);
      }).toList();
}
