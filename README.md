# Responsive Breakpoints

A Flutter package providing a flexible system for defining and resolving responsive layout breakpoints. Inspired by popular CSS frameworks (Tailwind, Bootstrap, Ant Design) and Material 3 guidelines, it allows you to adapt your UI to different screen widths with ease.

---

## Features

* **Theme-based resolution** via `ResponsiveBreakpointTheme` extension
* **Customizable**: define your own breakpoints by implementing `BreakpointSpec`
* **Predefined enums** for common systems:

    * **TailwindBreakpoint** (`sm`, `md`, `lg`, `xl`, `xxl`)
    * **MaterialUIBreakpoint** (`small`, `medium`, `large`)
    * **BootstrapBreakpoint** (`xs`, `sm`, `md`, `lg`, `xl`, `xxl`)
    * **AntBreakpoint** (`xs`, `sm`, `md`, `lg`, `xl`, `xxl`)
* **Comparison operators** (`<`, `>`, `<=`, `>=`) on `BreakpointSpec`

---

## Installation

Add the dependency in your `pubspec.yaml`:

```yaml
dependencies:
  responsive_breakpoints: latest_version
```

Then run:

```bash
flutter pub get
```

---

## Usage

### Wrap your app theme with `ResponsiveBreakpointTheme`, providing a list of breakpoints:

```dart
import 'package:flutter/material.dart';
import 'package:responsive_breakpoints/responsive_breakpoints.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        extensions: [
          ResponsiveBreakpointTheme<TailwindBreakpoint>(
            breakpoints: TailwindBreakpoint.values,
          ),
        ],
      ),
      home: const MyHomePage(),
    ),
  );
}
```

### Current breakpoint anywhere in your widget tree:

```dart
TextSpan(switch (ResponsiveBreakpointTheme.of<BootstrapBreakpoint>(context)) {
    BootstrapBreakpoint.xs => '<576px',
    BootstrapBreakpoint.sm => '≥576px',
    BootstrapBreakpoint.md => '≥768px',
    BootstrapBreakpoint.lg => '≥992px',
    BootstrapBreakpoint.xl => '≥1200px',
    BootstrapBreakpoint.xxl => '≥1400px',
  },
),
```

---

## Predefined Breakpoints

### TailwindBreakpoint

| Name | Min Width |
| :--: | :-------: |
|  sm  |   640px   |
|  md  |   768px   |
|  lg  |   1024px  |
|  xl  |   1280px  |
|  xxl |   1536px  |

### MaterialUIBreakpoint

|  Name  | Range     |
| :----: | :-------- |
|  small | <600px    |
| medium | 600–839px |
|  large | ≥840px    |

### BootstrapBreakpoint

| Name | Min Width |
| :--: | :-------: |
|  xs  |    0px    |
|  sm  |   576px   |
|  md  |   768px   |
|  lg  |   992px   |
|  xl  |   1200px  |
|  xxl |   1400px  |

### AntBreakpoint

| Name | Min Width |
| :--: | :-------: |
|  xs  |    0px    |
|  sm  |   576px   |
|  md  |   768px   |
|  lg  |   992px   |
|  xl  |   1200px  |
|  xxl |   1600px  |

---

## Custom Breakpoints

To define your own system, implement `BreakpointSpec`:

```dart
enum MyBreakpoints implements BreakpointSpec {
  mobile(breakpoint: 0),
  tablet(breakpoint: 600),
  desktop(breakpoint: 1024);

  @override
  final double breakpoint;

  const MyBreakpoints({required this.breakpoint});
}
```

Then add it to your theme:

```dart
ThemeData(
  extensions: [
    ResponsiveBreakpointTheme<MyBreakpoints>(
      breakpoints: MyBreakpoints.values,
    ),
  ],
);
```

Resolve and compare just like the built-in enums.

---

## API Reference

* **`ResponsiveBreakpointTheme<T extends BreakpointSpec>`**

    * `resolveBreakpoint(context)` — returns the current `T` based on screen width
    * `static of<T>(context)` — helper to resolve from theme extensions

* **`BreakpointComparison`** extension on `BreakpointSpec`

    * Operators: `>`, `<`, `>=`, `<=`

* **`BreakpointSpec`** interface:

    * `final double breakpoint`

* **Enums**: `TailwindBreakpoint`, `MaterialUIBreakpoint`, `BootstrapBreakpoint`, `AntBreakpoint`.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
