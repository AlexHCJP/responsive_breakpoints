import 'package:flutter/material.dart';

import 'package:responsive_breakpoints/breakpoint_spec.dart';
import 'package:responsive_breakpoints/responsive_breakpoints.dart';

/// A theme extension that allows customizing and resolving breakpoints
/// based on screen width, using [MediaQuery].
///
/// [T] must implement [BreakpointSpec], which defines a `breakpoint` value
/// (e.g. for screen width breakpoints like sm, md, lg).
class ResponsiveBreakpointTheme<T extends BreakpointSpec>
    extends ThemeExtension<ResponsiveBreakpointTheme<T>> {
  /// Creates a [ResponsiveBreakpointTheme] with a required list of breakpoints.
  const ResponsiveBreakpointTheme({required this.breakpoints});

  /// List of breakpoints sorted by width (ascending).
  final List<T> breakpoints;

  /// Resolves the appropriate breakpoint for the current screen width
  /// based on [MediaQuery].
  ///
  /// If the screen width falls between two breakpoints, it returns the current.
  /// If it exceeds all breakpoints, the last one is returned.
  T resolveBreakpoint(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    for (var i = 0; i < breakpoints.length; i++) {
      final current = breakpoints[i];
      final next = i + 1 < breakpoints.length ? breakpoints[i + 1] : null;

      if (next != null &&
          current.breakpoint <= width &&
          next.breakpoint > width) {
        return current;
      }
    }

    // Return the last breakpoint if none matched (usually the largest one).
    return breakpoints.last;
  }

  /// Static helper to get the resolved breakpoint of type [T]
  /// from the current [BuildContext].
  ///
  /// Will throw an assert error if [ResponsiveBreakpointTheme<T>] is not found
  /// in the [ThemeData.extensions].
  static T of<T extends BreakpointSpec>(BuildContext context) {
    final theme = Theme.of(context).extension<ResponsiveBreakpointTheme<T>>();
    assert(
      theme != null,
      'ResponsiveBreakpointTheme<$T> is not added to ThemeData.extensions',
    );
    return theme!.resolveBreakpoint(context);
  }

  /// Creates a copy of the theme with optionally updated breakpoints.
  @override
  ResponsiveBreakpointTheme<T> copyWith({List<T>? breakpoints}) =>
      ResponsiveBreakpointTheme<T>(
        breakpoints: breakpoints ?? this.breakpoints,
      );

  /// Defines how to interpolate between two [ResponsiveBreakpointTheme]s.
  ///
  /// Returns `this` if `t < 0.5`, otherwise `other`.
  @override
  ResponsiveBreakpointTheme<T> lerp(
    covariant ResponsiveBreakpointTheme<T>? other,
    double t,
  ) {
    if (other == null) return this;
    return t < 0.5 ? this : other;
  }

  /// Required for theme extension to identify the type.
  @override
  Type get type => ResponsiveBreakpointTheme<T>;
}
