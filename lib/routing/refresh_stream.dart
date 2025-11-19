import 'dart:async';

import 'package:flutter/foundation.dart';

/// Converts a [Stream] into a [Listenable] for GoRouter.
class GoRouterRefreshStream extends ChangeNotifier {
  /// The stream to listen to.
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
