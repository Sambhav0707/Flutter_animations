# Flutter Implicit Animations 2

A Flutter project demonstrating implicit animations using `TweenAnimationBuilder` with smooth transitions between images and colors.

## Features

- **TweenAnimationBuilder**: Implements smooth animations based on slider value
- **Image Transitions**: Fade between Spiderman and Batman images using `AnimatedOpacity`
- **Color Transitions**: Smooth color interpolation from black to grey using `Color.lerp()`
- **Interactive Slider**: Control animation progress with a slider widget

## How It Works

The app uses a `TweenAnimationBuilder` that responds to slider value changes:

- **Slider at 0.0**: Shows Spiderman image with black container
- **Slider at 0.5**: Both images partially visible, grey-ish container
- **Slider at 1.0**: Shows Batman image with grey container

### Animation Components

1. **TweenAnimationBuilder**: Provides the foundation for smooth value interpolation
2. **AnimatedOpacity**: Handles fade transitions between images
3. **Color.lerp()**: Interpolates between black and grey colors
4. **Stack Widget**: Allows both images to be positioned on top of each other

## Assets

The project includes two image assets:
- `assets/spiderman.png` - Initial image
- `assets/batman.png` - Transition target image

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Ensure the image assets are in the `assets/` folder
4. Run the app with `flutter run`

## Dependencies

- Flutter SDK
- No additional packages required

## Animation Duration

- TweenAnimationBuilder: 500ms
- Spiderman fade out: 200ms  
- Batman fade in: 300ms

This project demonstrates how to create smooth, interactive animations using Flutter's implicit animation widgets.
