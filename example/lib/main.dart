import 'package:flutter/material.dart';
import 'package:mediarequest/mediarequest.dart';

enum LayoutBreakpoint implements BreakpointSpec {
  s(breakpoint: 0),
  sm(breakpoint: 600),
  md(breakpoint: 1200),
  lg(breakpoint: 1400);

  const LayoutBreakpoint({required this.breakpoint});

  @override
  final double breakpoint;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        extensions: [
          ResponsiveBreakpointTheme(
            breakpoints: LayoutBreakpoint.values,
          ),
          ResponsiveBreakpointTheme(
            breakpoints: BootstrapBreakpoint.values,
          ),
        ],
      ),
      home: Scaffold(body: Center(child: Content())),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(MediaQuery.of(context).size.width.toString()),
        Text.rich(TextSpan(children: [
          TextSpan(text: 'Custom breakpoints: '),
          TextSpan(text: switch (ResponsiveBreakpointTheme.of<LayoutBreakpoint>(context)) {
            LayoutBreakpoint.s => '< 600px',
            LayoutBreakpoint.sm => '≥ 600px',
            LayoutBreakpoint.md => '≥ 1200px',
            LayoutBreakpoint.lg => '≥ 1400px',
          })
        ])),
        Text.rich(
          TextSpan(children: [
            const TextSpan(text: 'Bootstrap breakpoints: '),
            TextSpan(
              text: switch (ResponsiveBreakpointTheme.of<BootstrapBreakpoint>(context)) {
                BootstrapBreakpoint.xs => '<576px',
                BootstrapBreakpoint.sm => '≥576px',
                BootstrapBreakpoint.md => '≥768px',
                BootstrapBreakpoint.lg => '≥992px',
                BootstrapBreakpoint.xl => '≥1200px',
                BootstrapBreakpoint.xxl => '≥1400px',
              },
            ),
          ]),
        ),

      ],
    );
  }
}
