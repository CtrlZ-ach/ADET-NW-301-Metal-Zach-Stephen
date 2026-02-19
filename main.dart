import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      debugShowCheckedModeBanner: false,
      home: const DiceHomePage(),
    );
  }
}

class DiceHomePage extends StatefulWidget {
  const DiceHomePage({super.key});

  @override
  State<DiceHomePage> createState() => _DiceHomePageState();
}

class _DiceHomePageState extends State<DiceHomePage> {
  int diceNumber1 = 1;
  int diceNumber2 = 1;
  final Random random = Random();

  void rollDice() {
    setState(() {
      diceNumber1 = random.nextInt(6) + 1;
      diceNumber2 = random.nextInt(6) + 1;
    });
  }

  void resetDice() {
    setState(() {
      diceNumber1 = 1;
      diceNumber2 = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dice App Activity'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/$diceNumber1.png',
                  width: 120,
                ),
                const SizedBox(width: 20),
                Image.asset(
                  'assets/images/$diceNumber2.png',
                  width: 120,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'You rolled: ${diceNumber1 + diceNumber2}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color
                foregroundColor: Colors.white, // Text color
              ),
              child: const Text('Roll Dice'),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetDice,
              child: const Text('Reset Dice'),
            ),
          ],
        ),
      ),
    );
  }
}