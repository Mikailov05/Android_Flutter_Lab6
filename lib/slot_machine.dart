import 'package:flutter/material.dart';
import 'dart:math';
import 'package:slot_machine/slot_row.dart';

class SlotMachine extends StatefulWidget {
  const SlotMachine({super.key});

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
  final _random = Random();
  final _symbols = [
    'assets/images/cherry.jpg',
    'assets/images/lemon.jpg',
    'assets/images/seven.jpg'
  ];
  var _coins = 10;
  var _slot1 = 'assets/images/cherry.jpg';
  var _slot2 = 'assets/images/lemon.jpg';
  var _slot3 = 'assets/images/seven.jpg';
  var message = '';

  void _spin() {
    setState(() {
      _slot1 = _symbols[_random.nextInt(_symbols.length)];
      _slot2 = _symbols[_random.nextInt(_symbols.length)];
      _slot3 = _symbols[_random.nextInt(_symbols.length)];

      if (_slot1 == _slot2 && _slot2 == _slot3) {
        _coins += 3;
        message = 'Победа! +3 монеты';
      } else {
        _coins -= 1;
        message = 'Попробуй ещё раз -1 монета';
      }
    });
  }

  void _reset() {
    setState(() {
      _coins = 10;
      _slot1 = 'assets/images/cherry.jpg';
      _slot2 = 'assets/images/lemon.jpg';
      _slot3 = 'assets/images/seven.jpg';
      message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Монеты: $_coins',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),
        SlotRow(
          slot1: _slot1,
          slot2: _slot2,
          slot3: _slot3,
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: _coins > 0 ? _spin : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            padding: EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 16,
            ),
          ),
          child: Text(
            'КРУТИТЬ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 12),
        TextButton(
          onPressed: _reset,
          child: Text(
            'Начать заново',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}