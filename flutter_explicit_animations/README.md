# Flutter Explicit Animations Example

A comprehensive Flutter project demonstrating advanced explicit animations using `AnimationController` and `AnimatedBuilder`. This project showcases how to create complex, controlled animations with custom clipping paths and sequential animation sequences.

## 🎯 Project Overview

This project demonstrates the power of Flutter's explicit animation system by creating a Star Wars-inspired animation sequence featuring:
- A spaceship with a dynamic energy beam effect
- Custom gradient animations using `CustomClipper`
- Sequential animation timing with `AnimationController`
- Interactive text animations with opacity and size changes

## ✨ Key Features

### 🚀 Spaceship Animation
- **Custom Beam Effect**: Animated gradient beam that grows from the spaceship
- **Dynamic Clipping**: Custom `CustomClipper` implementation for beam shape
- **Sequential Timing**: Coordinated animation sequence with multiple controllers

### 📝 Text Animation
- **Fade-in Effect**: Text appears with smooth opacity transition
- **Size Animation**: Text container grows from zero to full size
- **Sequential Playback**: Text animation starts after beam animation completes

### 🎨 Visual Effects
- **Background Image**: Star field background for immersive experience
- **Gradient Overlays**: Radial gradients with animated opacity
- **Custom Clipping Paths**: Dynamic beam shape using mathematical calculations

## 🛠️ Technical Implementation

### Animation Controllers
```dart
late AnimationController _controller;  // Controls beam animation
late AnimationController _controller2; // Controls text animation
```

### Custom Clipper
The `CustomGradient` class creates a dynamic beam shape:
- **Top Width**: Narrow line at the beam origin
- **Bottom Width**: Expands to create a cone effect
- **Height Animation**: Beam grows from ship to screen bottom
- **Mathematical Interpolation**: Smooth transitions using animation values

### Animation Sequence
1. **Beam Animation**: 4-second duration with growing beam effect
2. **Text Animation**: 4-second duration with fade-in and size growth
3. **Loop Sequence**: Automatic restart for continuous playback

## 🚀 Getting Started

### Prerequisites
- **Flutter SDK**: Version 3.7.0 or higher
- **Dart SDK**: Latest stable version
- **IDE**: Android Studio, VS Code, or any Flutter-compatible editor

### Installation

1. **Clone the repository** (if not already done)
   ```bash
   git clone <repository-url>
   cd flutter_explicit_animations_example/flutter_explicit_animations
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the project**
   ```bash
   flutter run
   ```

### Asset Requirements
The project requires the following assets in the `assets/` directory:
- `star.jpg` - Background star field image
- `ship.png` - Spaceship image for the animation

## 📁 Project Structure

```
flutter_explicit_animations/
├── lib/
│   ├── main.dart              # App entry point and MaterialApp setup
│   └── home_page.dart         # Main animation implementation
├── assets/
│   ├── star.jpg              # Background star field
│   └── ship.png              # Spaceship image
├── pubspec.yaml              # Dependencies and asset configuration
└── README.md                 # This documentation
```

## 🎮 How It Works

### Animation Flow
1. **Initialization**: Two `AnimationController` instances are created with 4-second durations
2. **Beam Animation**: `_controller` animates the beam from narrow to wide cone shape
3. **Text Animation**: `_controller2` animates text appearance after beam completes
4. **Loop**: Sequence automatically restarts for continuous playback

### Custom Clipper Logic
The beam shape is calculated using:
- **Top Position**: Fixed narrow width at ship position
- **Bottom Position**: Animated width and height based on controller value
- **Path Construction**: Custom Path object with mathematical interpolation

### Animation Values
- **Beam Height**: `0.0` to `1.0` (ship position to screen bottom)
- **Beam Width**: `10.0` to `width * 1.5` (narrow line to wide cone)
- **Text Opacity**: `0.0` to `1.0` (transparent to visible)
- **Text Size**: `0.0` to full container size

## 🔧 Customization

### ### CHANGE THIS #### - Animation Parameters
You can modify the animation behavior by adjusting these values in `home_page.dart`:

```dart
// Animation duration
_controller = AnimationController(
  vsync: this,
  duration: Duration(seconds: 4), // ### CHANGE THIS #### - Adjust timing
);

// Beam dimensions
double topWidth = 10.0; // ### CHANGE THIS #### - Beam start width
double maxBottomWidth = width * 1.5; // ### CHANGE THIS #### - Beam end width

// Animation sequence timing
_controller.forward().then((_) {
  _controller2.forward().then((_) {
    startAnimationSequence(); // ### CHANGE THIS #### - Modify loop behavior
  });
});
```

### Visual Customization
- **Colors**: Modify gradient colors in the `RadialGradient`
- **Text**: Change the animated text content
- **Timing**: Adjust animation durations and delays
- **Beam Shape**: Modify the `CustomGradient` calculations

## 🎓 Learning Objectives

This project demonstrates:
- **Explicit Animations**: Using `AnimationController` and `AnimatedBuilder`
- **Custom Clipping**: Creating dynamic shapes with `CustomClipper`
- **Sequential Animation**: Coordinating multiple animation controllers
- **Mathematical Interpolation**: Smooth value transitions
- **Asset Integration**: Using images in animations
- **Animation Lifecycle**: Proper initialization and disposal

## 🐛 Troubleshooting

### Common Issues
1. **Assets Not Found**: Ensure `star.jpg` and `ship.png` are in the `assets/` directory
2. **Animation Not Starting**: Check that `TickerProviderStateMixin` is properly implemented
3. **Performance Issues**: Consider reducing animation complexity for lower-end devices

### Debug Tips
- Use `print()` statements to debug animation values
- Check controller state with `_controller.isAnimating`
- Verify asset paths in `pubspec.yaml`

## 📚 Related Resources

- [Flutter Animation Documentation](https://docs.flutter.dev/development/ui/animations)
- [AnimationController Guide](https://docs.flutter.dev/development/ui/animations/tutorial)
- [CustomClipper Examples](https://api.flutter.dev/flutter/rendering/CustomClipper-class.html)
- [AnimatedBuilder Tutorial](https://docs.flutter.dev/development/ui/animations/tutorial#animatedbuilder)

## 🤝 Contributing

Feel free to contribute improvements:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This project is part of the Flutter Examples Collection and is available under the MIT License.

---

**May the force be with you! 🚀✨**
