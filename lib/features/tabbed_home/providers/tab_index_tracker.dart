import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tab_index_tracker.g.dart';

@riverpod
class TabIndexTracker extends _$TabIndexTracker {

  @override
  int build() => 0;

  /// Set the index to something new
  void setIndex({required int value, Function(int)? onIndexSelected}) {
    state = value;
    if (onIndexSelected != null) onIndexSelected(state);
  }

  /// Reset index
  void clearIndex() => state = 0;
}
