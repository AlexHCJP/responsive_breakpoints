import 'package:responsive_breakpoints/breakpoint_spec.dart';
import 'package:responsive_breakpoints/responsive_breakpoints.dart';

/// Defines responsive layout breakpoints following the Ant Design system.
///
/// Implements [BreakpointSpec] so that each value has an associated
/// screen width threshold (`breakpoint`) used to determine which layout
/// should apply at a given screen width.
///
/// These breakpoints align with typical Ant Design breakpoints:
///
/// - `xs`: <576px
/// - `sm`: ≥576px
/// - `md`: ≥768px
/// - `lg`: ≥992px
/// - `xl`: ≥1200px
/// - `xxl`: ≥1600px
///
/// Example:
/// ```dart
/// final current = ResponsiveBreakpointTheme.of<AntBreakpoint>(context);
/// if (current >= AntBreakpoint.lg) {
///   // Render desktop layout
/// }
/// ```
enum AntBreakpoint implements BreakpointSpec {
  /// Extra small: <576px
  xs(breakpoint: 0),

  /// Small: ≥576px
  sm(breakpoint: 576),

  /// Medium: ≥768px
  md(breakpoint: 768),

  /// Large: ≥992px
  lg(breakpoint: 992),

  /// Extra large: ≥1200px
  xl(breakpoint: 1200),

  /// Extra extra large: ≥1600px
  xxl(breakpoint: 1600);

  /// Creates an [AntBreakpoint] with a specified [breakpoint] value.
  const AntBreakpoint({required this.breakpoint});

  @override
  final double breakpoint;
}
