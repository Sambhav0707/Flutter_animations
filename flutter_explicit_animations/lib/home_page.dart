import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    // Start the animation sequence
    startAnimationSequence();
  }

  void startAnimationSequence() {
    // Reset both controllers
    _controller.reset();
    _controller2.reset();

    // Start the beam animation, then start text animation when complete
    _controller.forward().then((_) {
      _controller2.forward().then((_) {
        // When both animations complete, restart the sequence
        startAnimationSequence();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/star.jpg', fit: BoxFit.cover),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              width: 300,
              height: 200,
              child: Stack(
                children: [
                  // Image layer
                  Positioned.fill(
                    child: Image.asset('assets/ship.png', fit: BoxFit.contain),
                  ),
                ],
              ),
            ),
          ),

          // Cone gradient overlay
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                child: ClipPath(
                  clipper: CustomGradient(
                    height: _controller.value,
                    width: 300,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        radius: 1.5,
                        colors: [
                          _controller.isAnimating
                              ? Colors.yellow.shade300.withValues(
                                alpha: _controller.value,
                              )
                              : Colors.transparent, // Animate opacity
                          Colors.transparent,
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _controller2,
              builder: (context, child) {
                return Container(
                  margin: EdgeInsets.only(
                    top: 50,
                    bottom: 100,
                    left: 30,
                    right: 30,
                  ),
                  width:
                      0 +
                      (100 *
                          _controller2.value), // Start at 100, animate to 300
                  height:
                      0 +
                      (50 * _controller2.value), // Start at 100, animate to 200
                  child: Center(
                    child: Text(
                      // ignore: spell_check
                      "May the force be with you",

                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.yellow.withOpacity(
                          _controller2.value,
                        ), // Start transparent, animate to visible
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Positioned(
          //   bottom: 0,

          //   child: Container(
          //     color: Colors.amberAccent,
          //     width: 300, // Start at 100, animate to 300
          //     height: 100,
          //     // Start at 100, animate to 200
          //     child: Center(
          //       child: Text(
          //         // ignore: spell_check
          //         "you",

          //         style: TextStyle(
          //           decoration: TextDecoration.none,
          //           color:
          //               Colors.white, // Start transparent, animate to visible
          //           fontSize: 20,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CustomGradient extends CustomClipper<Path> {
  final double height;
  final double width;
  CustomGradient({required this.height, required this.width});

  @override
  getClip(Size size) {
    // ### CHANGE THIS #### - Animate beam from zero height and narrow width to full size
    double topWidth = 10.0; // Width of the beam at the top (narrow line)
    double maxBottomWidth =
        width * 1.5; // Maximum width of the beam at the bottom
    double animatedBottomWidth =
        10.0 +
        (maxBottomWidth - 10.0) * height; // Animate width from narrow to wide
    double shipEndY = 210.0; // Y position where ship image ends (50 + 200)
    double fullBeamEndY = size.height * 0.7; // Full beam height
    double animatedBeamEndY =
        shipEndY + (fullBeamEndY - shipEndY) * height; // Animate height

    return Path()
      ..moveTo(
        size.width / 2 - topWidth / 2,
        shipEndY, // Start at ship's end position
      )
      ..lineTo(size.width / 2 + topWidth / 2, shipEndY)
      ..lineTo(
        size.width / 2 + animatedBottomWidth / 2,
        animatedBeamEndY, // Use animated height and width
      )
      ..lineTo(
        size.width / 2 - animatedBottomWidth / 2,
        animatedBeamEndY, // Use animated height and width
      )
      ..close();
  }

  /// Return true for animation updates.
  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
