import 'package:responsive_breakpoints/responsive_breakpoints.dart';

/// Defines breakpoints based on the Material 3 layout system.
///
/// These breakpoints are used to adapt UI layouts depending on screen width,
/// as recommended by the [Material Design responsive layout guidelines](https://m3.material.io/foundations/layout/applying-layout/window-size-classes).
///
/// Implements [BreakpointSpec] so it can be used with utilities like
/// [ResponsiveBreakpointTheme].
///
/// ### Breakpoint Ranges:
/// - `small`: <600 px — typically phones
/// - `medium`: 600–839 px — typically tablets
/// - `large`: ≥840 px — typically desktops
///
/// ### Example:
/// ```dart
/// final current = ResponsiveBreakpointTheme.of<MaterialUIBreakpoint>(context);
/// if (current == MaterialUIBreakpoint.large) {
///   // Render wide-screen layout
/// }
/// ```
enum MaterialUIBreakpoint implements BreakpointSpec {
  /// Small window size: less than 600px.
  small(breakpoint: 0),

  /// Medium window size: 600px to 839px.
  medium(breakpoint: 600),

  /// Large window size: 840px and up.
  large(breakpoint: 840);

  /// Creates a [MaterialUIBreakpoint] with the specified [breakpoint] value.
  const MaterialUIBreakpoint({required this.breakpoint});

  @override
  final double breakpoint;
}
