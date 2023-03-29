# Hold on pop

`hold_on_pop` is a Flutter package that provides a widget that shows a popup when the user presses their finger and closes when they release it (like Instagram).

## Features

- Provides a customizable widget that shows a popup when the user holds their finger on it.
- Supports customizing the look and feel of the widget, including the size, color, and shape of the popup.
- Provides callbacks for handling when the user presses and releases their finger on the widget.

![Hold on pop basic](https://media.giphy.com/media/vJlnDRyubtAEG1w3Sz/giphy.gif)

## Getting Started

To use `hold_on_pop`, add `hold_on_pop` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  hold_on_pop: ^1.0.0
```

Then, import the package in your Dart code:

```dart
import 'package:hold_on_pop/hold_on_pop.dart';
```

## Usage
`hold_on_pop` provides a HoldOnPop widget that you can use in your Flutter app. The widget is typically used to provide contextual help or information to the user when they long press on a specific part of the screen.

Here's an example of how to use the `HoldOnPop` widget:

```dart
HoldOnPop(
    child: Container(
    height: 100,
    width: 100,
    color: Colors.blue,
    ),
    popup: Container(
    height: 50,
    width: 50,
    color: Colors.red,
    ),
);
```

In this example, we create a HoldOnPop widget with a blue Container as the child. We also define a `popup` property that creates a red Container as the popup.

## Additional Information

- For more information on how to use the `HoldOnPop` widget, please see the example app in the `/example` directory.
- If you encounter any issues or have any suggestions for improving the package, please file an issue on the [GitHub repository](https://github.com/sytungan/hold_on_pop/issues).
<!-- - Contributions are welcome! Please see the [contributing guidelines](https://github.com/sytungan/hold_on_pop/blob/main/CONTRIBUTING.md) for more information. -->

## Changelog

See [CHANGELOG.md](https://github.com/sytungan/hold_on_pop/blob/main/CHANGELOG.md) for the latest updates and changes to the package.

## License

This package is available under the [MIT License](https://opensource.org/licenses/MIT). See the [LICENSE](https://github.com/sytungan/hold_on_pop/blob/main/LICENSE) file for more information.
