import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ghjkl"),),

      body: Placeholder(),
    );
  }
}
