import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('AnimationController Example')),
        body: Center(child: AnimatedBox()),
      ),
    );
  }
}

class AnimatedBox extends StatefulWidget {
  @override
  _AnimatedBoxState createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initializing the AnimationController with a duration of 2 seconds
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Defining a Tween that will animate the width of a container from 50 to 200
    _animation = Tween<double>(begin: 50, end: 200).animate(_controller)
      ..addListener(() {
        setState(() {}); // Update the UI on every frame change
      });

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _animation.value, // Use the animation value to change the width
      height: 50,
      color: Colors.blue,
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }
}
