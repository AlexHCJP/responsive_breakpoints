
# 📱 responsive_breakpoints

A Flutter package that helps you build responsive layouts using enums to represent breakpoints like `sm`, `md`, `lg`, and more.

---

## ✨ Features

- Define custom breakpoint enums
- Access breakpoints using context
- Easily adapt UI to screen width
- Type-safe and declarative design

---

## 🚀 Getting Started

Add the dependency in your `pubspec.yaml`:

```yaml
dependencies:
  responsive_breakpoints: ^0.0.1
````

Then run:

```bash
flutter pub get
```

---

## 🧩 Usage

### 1. Define your enum

```dart
enum LayoutBreakpoint implements BreakpointSpec {
  sm(breakpoint: 600),
  md(breakpoint: 1024),
  lg(breakpoint: 1440);

  const LayoutBreakpoint({required this.breakpoint});
  @override
  final double breakpoint;
}
```

### 2. Wrap your app (usually near `MaterialApp`)

```dart
ResponsiveBreakpointTheme(
  data: ResponsiveBreakpointData(breakpoints: LayoutBreakpoint.values),
  child: MaterialApp(...),
)
```

### 3. Use it anywhere in the widget tree

```dart
final breakpoint = ResponsiveBreakpointTheme.of<LayoutBreakpoint>(context);

switch (breakpoint) {
  case LayoutBreakpoint.sm:
    return SmallLayout();
  case LayoutBreakpoint.md:
    return MediumLayout();
  case LayoutBreakpoint.lg:
    return LargeLayout();
}
```

---


## 🔗 Links

* [Repository](https://github.com/AlexHCJP/responsive_breakpoints)
* [Issues](https://github.com/AlexHCJP/responsive_breakpoints/issues)

---

## 📄 License

This project is licensed under the MIT License.