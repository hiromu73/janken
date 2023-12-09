
import 'dart:math';

import 'package:flutter/material.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {

  Hand? myHand;
  Hand? computerHand;
  Result? result;

  void  chooseComputerText()  {
    final random = Random();
    final randomNumber = random.nextInt(3);
    final hand = Hand.values[randomNumber];
    setState(() {
      computerHand = hand;
    });
    decideResult ();
  }

  void decideResult () {
    if (myHand == null && computerHand == null) {
      return;
    }

    final Result result;

    if (myHand == computerHand) {
      result = Result.win;
    }
    else {
      result = Result.lose;
    }

    setState(() {
      this.result = result;
    });
  }

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
                myHand = Hand.up;
              });
              chooseComputerText();
              },
              tooltip: 'Increment',
              child: const Text('👆',style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(width: 10,),
            FloatingActionButton(
                onPressed: () {setState(() {
                  myHand = Hand.down;
                });chooseComputerText();},
                tooltip: 'Increment',
                child: const Text('👇',style: TextStyle(fontSize: 30),)
            ),
            const SizedBox(width: 10,),
            FloatingActionButton(
                onPressed: () {setState(() {
                  myHand = Hand.left;
                });chooseComputerText();},
                tooltip: 'Increment',
                child: const Text('👈',style: TextStyle(fontSize: 30),)
            ),
            FloatingActionButton(
                onPressed: () {setState(() {
                  myHand = Hand.right;
                });chooseComputerText();},
                child: const Text('👉',style: TextStyle(fontSize: 30),)
            ),
          ],
        ),
    );
  }
}

enum Hand {
  up,down,left,right;

  String get text {
    switch (this) {
      case Hand.up:
        return '👆';
      case Hand.down:
        return '👇';
      case Hand.left:
        return '👈';
      case Hand.right:
        return '👉';
    }
  }
}

enum Result {
  win,
  lose;

  String get text {
    switch (this) {
      case Result.win:
        return '勝ち';
      case Result.lose:
        return '負け';
    }
  }
}