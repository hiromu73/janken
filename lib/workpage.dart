
import 'dart:math';

import 'package:flutter/material.dart';

class Work extends StatefulWidget {
  const Work({super.key});

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Work'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '相手',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              computerHand?.text ?? '?',
              style: const TextStyle(fontSize: 100),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(result?.text ?? '?',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              myHand?.text ?? '?',
              style: const TextStyle(fontSize: 100),
            ),
            const Text(
              '自分',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {setState(() {
                myHand = Hand.rock;
              });
              chooseComputerText();
              },
              tooltip: 'Increment',
              child: const Text('👊',style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(width: 10,),
            FloatingActionButton(
                onPressed: () {setState(() {
                  myHand = Hand.scissors;
                });chooseComputerText();},
                tooltip: 'Increment',
                child: const Text('✌️',style: TextStyle(fontSize: 30),)
            ),
            const SizedBox(width: 10,),
            FloatingActionButton(
                onPressed: () {setState(() {
                  myHand = Hand.paper;
                });chooseComputerText();},
                tooltip: 'Increment',
                child: const Text('✋',style: TextStyle(fontSize: 30),)
            ),
            FloatingActionButton(
                onPressed: () {setState(() {
                  myHand = Hand.paper;
                });chooseComputerText();},
                child: const Text('✋',style: TextStyle(fontSize: 30),)
            ),
          ],
        ), /
    );
  }
}
