import 'package:flutter/material.dart';


class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimations> createState() =>
      _ImplicitAnimationsState();
}

class _ImplicitAnimationsState
    extends State<ImplicitAnimations> {
  bool _boxExpanded = false;
  bool _visible = true;
  bool _alignedTop = false;
  bool _padded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Implicit Animations"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            title: "AnimatedContainer",
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              width: _boxExpanded ? 150 : 80,
              height: _boxExpanded ? 150 : 80,
              decoration: BoxDecoration(
                color: _boxExpanded ? Colors.blue : Colors.orange,
                borderRadius: BorderRadius.circular(_boxExpanded ? 0 : 24),
              ),
            ),
            onTap: () => setState(() => _boxExpanded = !_boxExpanded),
          ),
          _buildSection(
            title: "AnimatedOpacity",
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 600),
              opacity: _visible ? 1 : 0.2,
              child: const FlutterLogo(size: 80),
            ),
            onTap: () => setState(() => _visible = !_visible),
          ),
          _buildSection(
            title: "AnimatedAlign",
            child: Container(
              height: 100,
              color: Colors.grey.shade200,
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 600),
                alignment:
                    _alignedTop ? Alignment.topLeft : Alignment.bottomRight,
                curve: Curves.easeInOut,
                child: const Icon(Icons.star, color: Colors.purple, size: 36),
              ),
            ),
            onTap: () => setState(() => _alignedTop = !_alignedTop),
          ),
          _buildSection(
            title: "AnimatedPadding",
            child: Container(
              height: 100,
              color: Colors.grey.shade200,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 600),
                padding: EdgeInsets.all(_padded ? 30 : 8),
                child: Container(color: Colors.green),
              ),
            ),
            onTap: () => setState(() => _padded = !_padded),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Widget child,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Center(child: child),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(120, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Animate"),
            )
          ],
        ),
      ),
    );
  }
}
