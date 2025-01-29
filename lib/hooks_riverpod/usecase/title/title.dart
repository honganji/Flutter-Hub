import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/title/title.dart';

part 'title.g.dart';

@riverpod
class TitleData extends _$TitleData {
  @override
  Title build() {
    return const Title(title: 'Flutter Hub');
  }

  void changeTitle(String title) {
    state = Title(title: title);
  }
}
