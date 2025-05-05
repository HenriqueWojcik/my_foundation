import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../foundation.dart';

void logEvent(
  String message, {
  String? tag,
  StackTrace? stackTrace,
  String? error,
}) {
  final String logMessage = '${tag == null ? "" : "[$tag] "}$message';

  debugPrint(logMessage);

  if (error != null) {
    debugPrint('🟥 $logMessage\n🟥 $error\n🟥 $stackTrace');
    try {
      FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        reason: logMessage,
      );
    } catch (_) {}
  }
}
