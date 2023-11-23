// ignore_for_file: public_member_api_docs, sort_constructors_first

class Counter {
  final int initialValue;

  Counter({
    required this.initialValue,
  });

  Counter.empty() : initialValue = 0;

  Counter copyWith({
    int? initialValue,
  }) {
    return Counter(
      initialValue: initialValue ?? this.initialValue,
    );
  }
}
