import 'package:flutter/material.dart';

class GlosariumPage extends StatelessWidget {
  const GlosariumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GlosariumPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GlosariumPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
