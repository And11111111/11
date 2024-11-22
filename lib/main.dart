import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Border Radius")),
        body: BorderRadiusConfigurator(),
      ),
    );
  }
}

class BorderRadiusConfigurator extends StatefulWidget {
  @override
  _BorderRadiusConfiguratorState createState() =>
      _BorderRadiusConfiguratorState();
}

class _BorderRadiusConfiguratorState extends State<BorderRadiusConfigurator> {
  double topLeft = 0;
  double topRight = 0;
  double bottomLeft = 0;
  double bottomRight = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlueContainer(
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
        ),
        SizedBox(height: 20),
        SliderSection(
          label: "Top Left",
          value: topLeft,
          onChanged: (newValue) {
            setState(() {
              topLeft = newValue;
            });
          },
        ),
        SliderSection(
          label: "Top Right",
          value: topRight,
          onChanged: (newValue) {
            setState(() {
              topRight = newValue;
            });
          },
        ),
        SliderSection(
          label: "Bottom Left",
          value: bottomLeft,
          onChanged: (newValue) {
            setState(() {
              bottomLeft = newValue;
            });
          },
        ),
        SliderSection(
          label: "Bottom Right",
          value: bottomRight,
          onChanged: (newValue) {
            setState(() {
              bottomRight = newValue;
            });
          },
        ),
      ],
    );
  }
}

class BlueContainer extends StatelessWidget {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  const BlueContainer({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        ),
      ),
    );
  }
}

class SliderSection extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  const SliderSection({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$label: ${value.toStringAsFixed(0)}"),
        Slider(
          value: value,
          min: 0,
          max: 75,
          divisions: 15,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
