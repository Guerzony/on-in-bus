class Pair<First, Second> {
  Pair(this.first, this.second);

  final First first;
  final Second second;

  @override
  String toString() => 'Pair[$first, $second]';
}
