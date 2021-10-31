

part of 'countercubit.dart';
class CounterState {
  int counterValue;
  bool? wasIncremented;
  CounterState({
    required this.counterValue,
    this.wasIncremented
   });

 

  CounterState copyWith({
    int? counterValue,
    bool? wasIncremented,
  }) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
      wasIncremented: wasIncremented ?? this.wasIncremented,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'],
      wasIncremented: map['wasIncremented'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) => CounterState.fromMap(json.decode(source));

  @override
  String toString() => 'CounterState(counterValue: $counterValue, wasIncremented: $wasIncremented)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CounterState &&
      other.counterValue == counterValue &&
      other.wasIncremented == wasIncremented;
  }

  @override
  int get hashCode => counterValue.hashCode ^ wasIncremented.hashCode;
}
