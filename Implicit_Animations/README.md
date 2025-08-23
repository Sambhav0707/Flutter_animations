# Flutter Implicit Animations Example

A comprehensive Flutter application demonstrating various implicit animations using Flutter's built-in animated widgets. This project showcases how to create smooth, performant animations with minimal code using Flutter's implicit animation system.

## 🎯 Features

This example demonstrates four key implicit animations:

1. **AnimatedContainer** - Animates size, color, and border radius changes
2. **AnimatedOpacity** - Smoothly fades widgets in and out
3. **AnimatedAlign** - Animates widget positioning within a container
4. **AnimatedPadding** - Animates padding changes with smooth transitions

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (version 3.7.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Android Emulator or iOS Simulator (or physical device)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd flutter_implicit_animations_example
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## 📱 How to Use

1. Launch the app on your device/emulator
2. You'll see four different animation examples in a scrollable list
3. Tap the "Animate" button under each example to trigger the animation
4. Observe how each widget smoothly transitions between states

## 🎨 Animation Examples

### AnimatedContainer
- **What it does**: Animates size, color, and border radius changes
- **Animation**: Container expands from 80x80 to 150x150 pixels, changes color from orange to blue, and transforms from rounded corners to square corners
- **Duration**: 600ms with easeInOut curve

### AnimatedOpacity
- **What it does**: Smoothly fades the Flutter logo in and out
- **Animation**: Opacity changes from 1.0 (fully visible) to 0.2 (mostly transparent)
- **Duration**: 600ms

### AnimatedAlign
- **What it does**: Animates the position of a star icon within a container
- **Animation**: Star moves from bottom-right to top-left corner
- **Duration**: 600ms with easeInOut curve

### AnimatedPadding
- **What it does**: Animates padding changes around a green container
- **Animation**: Padding changes from 8px to 30px on all sides
- **Duration**: 600ms

## 🛠️ Technical Details

### Project Structure
```
lib/
├── main.dart              # App entry point
└── implicit_animations.dart # Main animation examples
```

### Key Dependencies
- `flutter`: Core Flutter framework
- `cupertino_icons`: iOS-style icons

### Animation Configuration
All animations use:
- **Duration**: 600 milliseconds for smooth, noticeable transitions
- **Curve**: `Curves.easeInOut` for natural-feeling animations
- **State Management**: Simple `setState()` calls to trigger animations

## 🎓 Learning Resources

This project demonstrates several important Flutter animation concepts:

1. **Implicit Animations**: Automatic animations that occur when widget properties change
2. **State Management**: Using `setState()` to trigger UI updates
3. **Animation Curves**: Using `Curves.easeInOut` for natural motion
4. **Duration Control**: Setting appropriate animation durations for good UX

## 🔧 Customization

### ### CHANGE THIS ####
To modify the animations, you can:

1. **Change animation duration**: Modify the `Duration(milliseconds: 600)` values
2. **Adjust animation curves**: Replace `Curves.easeInOut` with other curves like `Curves.bounceOut`, `Curves.elasticIn`, etc.
3. **Add new animations**: Create new sections using different `Animated*` widgets
4. **Modify colors and sizes**: Change the color values and dimension properties

### Example Customization
```dart
// Change animation duration
duration: const Duration(milliseconds: 1000), // Slower animation

// Use different curve
curve: Curves.bounceOut, // Bouncy effect

// Modify colors
color: _boxExpanded ? Colors.red : Colors.green, // Different colors
```

## 📱 Platform Support

This application supports:
- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🤝 Contributing

Feel free to contribute to this project by:
1. Adding new animation examples
2. Improving the UI/UX
3. Adding more customization options
4. Fixing bugs or issues

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Flutter team for the excellent animation system
- The Flutter community for inspiration and best practices

---

**Happy Animating! 🎉**
