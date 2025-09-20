void main() {
  var data = [
    1,
    [2, 3, 4],
    {'a': 5, 'b': ["ab", 7]},
    (first: 8, second: "c"),
    {'c': (first: 10, second: ["xy", 12])},
    "z",
    13.5,
    [14, {'d': 15, 'e': (first: "p", second: 17)}]
  ];

  int total = sumNested(data);
  print("Total sum: $total"); // Expected: 880
}

int sumNested(dynamic obj) {
  return switch (obj) {
    int n => n, 
    double d => d.floor(), 
    String s => sumAscii(s), 
    List<dynamic> l => l.fold(0, (sum, e) => sum + sumNested(e)), 
    Map<dynamic, dynamic> m => m.values.fold(0, (sum, v) => sum + sumNested(v)), 
    (var a, var b) => sumNested(a) + sumNested(b), 
    (first: var a, second: var b) => sumNested(a) + sumNested(b), 
    _ => 0 
  };
}

int sumAscii(String s) {
  int sum = 0;
  for (var rune in s.runes) {
    if (rune >= 0 && rune <= 127) { 
      sum += rune;
    }
  }
  return sum;
}
