import 'package:responsive_breakpoints/responsive_breakpoints.dart';

/// Defines responsive breakpoints based on the Tailwind CSS system.
///
/// These breakpoints represent minimum screen widths (in logical pixels)
/// and are used to adapt UI layouts responsively, similar to Tailwind's
/// utility-first design approach.
///
/// Implements [BreakpointSpec] so it integrates with utilities like
/// [ResponsiveBreakpointTheme].
///
/// ### Tailwind Breakpoint Ranges:
/// - `sm`: ≥640px
/// - `md`: ≥768px
/// - `lg`: ≥1024px
/// - `xl`: ≥1280px
/// - `xxl`: ≥1536px (corresponds to Tailwind's `2xl`)
///
/// > Note: Dart enums cannot start with a digit, so `2xl` is named `xxl`.
///
/// ### Example:
/// ```dart
/// final current = ResponsiveBreakpointTheme.of<TailwindBreakpoint>(context);
/// if (current >= TailwindBreakpoint.lg) {
///   // Render large screen layout
/// }
/// ```
enum TailwindBreakpoint implements BreakpointSpec {
  /// Small screen: ≥640px
  sm(breakpoint: 640),

  /// Medium screen: ≥768px
  md(breakpoint: 768),

  /// Large screen: ≥1024px
  lg(breakpoint: 1024),

  /// Extra large screen: ≥1280px
  xl(breakpoint: 1280),

  /// Extra extra large screen: ≥1536px (Tailwind's `2xl`)
  xxl(breakpoint: 1536);

  /// Creates a [TailwindBreakpoint] with the given [breakpoint] value.
  const TailwindBreakpoint({required this.breakpoint});

  @override
  final double breakpoint;
}
