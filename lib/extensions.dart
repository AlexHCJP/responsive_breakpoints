import 'package:responsive_breakpoints/breakpoint_spec.dart';
import 'package:responsive_breakpoints/responsive_breakpoints.dart';

/// Extension that adds comparison operators to [BreakpointSpec].
///
/// Allows using relational operators (`>`, `<`, `<=`, `>=`) directly
/// on objects that implement [BreakpointSpec], based on their [breakpoint] value.
///
/// Example:
/// ```dart
/// if (Breakpoint.sm > Breakpoint.xs) {
///   // do something
/// }
/// ```
extension BreakpointComparison on BreakpointSpec {
  /// Returns `true` if this breakpoint is greater than [other].
  bool operator >(BreakpointSpec other) => breakpoint > other.breakpoint;

  /// Returns `true` if this breakpoint is less than [other].
  bool operator <(BreakpointSpec other) => breakpoint < other.breakpoint;

  /// Returns `true` if this breakpoint is less than or equal to [other].
  bool operator <=(BreakpointSpec other) => breakpoint <= other.breakpoint;

  /// Returns `true` if this breakpoint is greater than or equal to [other].
  bool operator >=(BreakpointSpec other) => breakpoint >= other.breakpoint;
}
