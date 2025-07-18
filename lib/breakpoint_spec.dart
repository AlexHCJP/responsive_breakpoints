/// A contract for defining layout breakpoints based on screen width.
///
/// This `interface class` ensures that any implementing class or enum
/// provides a [breakpoint] value, which represents the minimum screen width
/// (in logical pixels) at which the breakpoint becomes active.
///
/// Typically used with [ResponsiveBreakpointTheme] to adapt layouts
/// responsively.
///
/// Example:
/// ```dart
/// enum MyBreakpoints implements BreakpointSpec {
///   sm(breakpoint: 600),
///   md(breakpoint: 960),
///   lg(breakpoint: 1280);
///
///   @override
///   final double breakpoint;
///
///   const MyBreakpoints({required this.breakpoint});
/// }
/// ```
interface class BreakpointSpec {
  /// Creates a [BreakpointSpec] with a required [breakpoint] value.
  const BreakpointSpec({required this.breakpoint});

  /// The minimum width (in logical pixels) at which this breakpoint applies.
  final double breakpoint;
}
