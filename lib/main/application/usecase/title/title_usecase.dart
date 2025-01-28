import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/title/title.dart';

part 'title_usecase.g.dart';

@riverpod
class TitleUsecase extends _$TitleUsecase {
  @override
  Title build() {
    return const Title(title: 'Flutter Hub');
  }

  void changeTitle(String title) {
    state = Title(title: title);
  }
}
