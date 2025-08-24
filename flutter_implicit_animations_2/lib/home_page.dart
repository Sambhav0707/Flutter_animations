import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Implicit Animations 2 ')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 500),
              tween: Tween<double>(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                
                final colorProgress = _sliderValue;
                final imageProgress = _sliderValue;

                final containerColor =
                    Color.lerp(
                      Colors.black,
                      Colors.grey,
                      colorProgress.clamp(0.0, 1.0),
                    )!;

                return Container(
                  margin: const EdgeInsets.all(25),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: containerColor),
                    boxShadow: [
                      BoxShadow(
                        color: containerColor.withValues(alpha: 0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: 1.0 - imageProgress.clamp(0.0, 1.0),
                          child: Image.asset(
                            'assets/spiderman.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),

                      Center(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: imageProgress.clamp(0.0, 1.0),
                          child: Image.asset(
                            'assets/batman.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Slider.adaptive(
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
