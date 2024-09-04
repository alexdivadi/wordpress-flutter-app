import 'package:wordpress_flutter_app/app/features/posts/data/favorites_repository.dart';
import 'package:wordpress_flutter_app/app/features/posts/data/post_client.dart';
import 'package:wordpress_flutter_app/app/features/settings/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/test_data.dart';
import 'mocks.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget, {List<Override>? overrides}) {
    final sharedPreferences = MockSharedPreferences();

    overrides ??= [
      getPostsProvider.overrideWith((ref) async => Future.value(mockPostResponse)),
      favoriteListProvider.overrideWith((ref) => Stream.value(mockPosts)),
      sharedPreferencesProvider.overrideWith((ref) => Future.value(sharedPreferences)),
    ];

    return pumpWidget(
      ProviderScope(
        overrides: overrides,
        child: widget,
      ),
    );
  }
}
