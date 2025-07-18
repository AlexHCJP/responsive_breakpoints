import 'package:flutter/material.dart';
import 'package:responsive_breakpoints/responsive_breakpoints.dart';

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
          ResponsiveBreakpointTheme(breakpoints: LayoutBreakpoint.values),
          ResponsiveBreakpointTheme(breakpoints: BootstrapBreakpoint.values),
          ResponsiveBreakpointTheme(breakpoints: MaterialUIBreakpoint.values),
          ResponsiveBreakpointTheme(breakpoints: TailwindBreakpoint.values),
          ResponsiveBreakpointTheme(breakpoints: AntBreakpoint.values),
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
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Custom breakpoints: '),
              TextSpan(
                text: switch (ResponsiveBreakpointTheme.of<LayoutBreakpoint>(
                  context,
                )) {
                  LayoutBreakpoint.s => '< 600px',
                  LayoutBreakpoint.sm => '≥ 600px',
                  LayoutBreakpoint.md => '≥ 1200px',
                  LayoutBreakpoint.lg => '≥ 1400px',
                },
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Bootstrap breakpoints: '),
              TextSpan(
                text: switch (ResponsiveBreakpointTheme.of<BootstrapBreakpoint>(
                  context,
                )) {
                  BootstrapBreakpoint.xs => '< 576px',
                  BootstrapBreakpoint.sm => '≥ 576px',
                  BootstrapBreakpoint.md => '≥ 768px',
                  BootstrapBreakpoint.lg => '≥ 992px',
                  BootstrapBreakpoint.xl => '≥ 1200px',
                  BootstrapBreakpoint.xxl => '≥ 1400px',
                },
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Tailwind breakpoints: '),
              TextSpan(
                text: switch (ResponsiveBreakpointTheme.of<TailwindBreakpoint>(
                  context,
                )) {
                  TailwindBreakpoint.xs => '< 640px',
                  TailwindBreakpoint.sm => '≥ 640px',
                  TailwindBreakpoint.md => '≥ 768px',
                  TailwindBreakpoint.lg => '≥ 1024px',
                  TailwindBreakpoint.xl => '≥ 1280px',
                  TailwindBreakpoint.xxl => '≥ 1536px',
                },
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Material UI breakpoints: '),
              TextSpan(
                text:
                    switch (ResponsiveBreakpointTheme.of<MaterialUIBreakpoint>(
                      context,
                    )) {
                      MaterialUIBreakpoint.small => '< 600px',
                      MaterialUIBreakpoint.medium => '< 839px',
                      MaterialUIBreakpoint.large => '≥ 840px',
                    },
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Ant Design breakpoints: '),
              TextSpan(
                text: switch (ResponsiveBreakpointTheme.of<AntBreakpoint>(
                  context,
                )) {
                  AntBreakpoint.xs => '< 576px',
                  AntBreakpoint.sm => '≥ 576px',
                  AntBreakpoint.md => '≥ 768px',
                  AntBreakpoint.lg => '≥ 992px',
                  AntBreakpoint.xl => '≥ 1200px',
                  AntBreakpoint.xxl => '≥ 1600px',
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
