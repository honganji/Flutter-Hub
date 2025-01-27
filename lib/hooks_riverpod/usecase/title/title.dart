import 'package:flutter_hub/hooks_riverpod/model/title/title.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'title.g.dart';

@riverpod
class TitleData extends _$TitleData {
  @override
  Title build() {
    return Title(title: 'Flutter Hub');
  }

  void changeTitle(String title) {
    state = Title(title: title);
  }
}
