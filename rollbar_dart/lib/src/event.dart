import 'package:meta/meta.dart';
import 'package:rollbar_common/rollbar_common.dart';

import 'data/payload/breadcrumb.dart';
import 'data/payload/user.dart';
import 'telemetry.dart';

@sealed
@immutable
class Event {
  final Level level;
  final dynamic error;
  final StackTrace? stackTrace;
  final String? message;
  final User? user;
  final Breadcrumb? breadcrumb;
  final Telemetry? telemetry;

  const Event({
    this.level = Level.info,
    this.error,
    this.stackTrace,
    this.message,
    this.user,
    this.breadcrumb,
    this.telemetry,
  });

  Event copyWith({
    Level? level,
    dynamic error,
    StackTrace? stackTrace,
    String? message,
    User? user,
    Breadcrumb? breadcrumb,
    Telemetry? telemetry,
  }) =>
      Event(
          level: level ?? this.level,
          error: error ?? this.error,
          stackTrace: stackTrace ?? this.stackTrace,
          message: message ?? this.message,
          user: user ?? this.user,
          breadcrumb: breadcrumb ?? this.breadcrumb,
          telemetry: telemetry ?? this.telemetry);

  @override
  String toString() => 'Event('
      'level: $level, '
      'error: $error, '
      'stackTrace: $stackTrace, '
      'message: $message, '
      'user: $user, '
      'breadcrumb: $breadcrumb, '
      'telemetry: $telemetry)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.level == level &&
          other.error == error &&
          other.stackTrace == stackTrace &&
          other.message == message &&
          other.user == user &&
          other.breadcrumb == breadcrumb &&
          other.telemetry == telemetry);

  @override
  int get hashCode => Object.hash(
        level,
        error,
        stackTrace,
        message,
        user,
        breadcrumb,
        telemetry,
      );
}
