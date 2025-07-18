import 'package:responsive_breakpoints/responsive_breakpoints.dart';

/// Defines breakpoints based on the Bootstrap 5 responsive layout system.
///
/// Each breakpoint corresponds to a minimum screen width in logical pixels,
/// and is used to adapt the UI layout responsively across different devices.
///
/// Implements [BreakpointSpec] so it can be used with utilities like
/// [ResponsiveBreakpointTheme].
///
/// ### Breakpoint Ranges (Bootstrap 5):
/// - `xs`: <576px (extra small)
/// - `sm`: ≥576px (small)
/// - `md`: ≥768px (medium)
/// - `lg`: ≥992px (large)
/// - `xl`: ≥1200px (extra large)
/// - `xxl`: ≥1400px (extra extra large)
///
/// ### Example:
/// ```dart
/// final current = ResponsiveBreakpointTheme.of<BootstrapBreakpoint>(context);
/// if (current >= BootstrapBreakpoint.lg) {
///   // Render desktop layout
/// }
/// ```
enum BootstrapBreakpoint implements BreakpointSpec {
  /// Extra small: less than 576px.
  xs(breakpoint: 0),

  /// Small: 576px and up.
  sm(breakpoint: 576),

  /// Medium: 768px and up.
  md(breakpoint: 768),

  /// Large: 992px and up.
  lg(breakpoint: 992),

  /// Extra large: 1200px and up.
  xl(breakpoint: 1200),

  /// Extra extra large: 1400px and up.
  xxl(breakpoint: 1400);

  /// Creates a [BootstrapBreakpoint] with the specified [breakpoint] value.
  const BootstrapBreakpoint({required this.breakpoint});

  @override
  final double breakpoint;
}
