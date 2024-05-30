import 'dart:math';

import 'package:flutter/material.dart';
import 'package:womenapp/widgets/home_widgets/custom_appBar.dart';
import 'package:womenapp/widgets/home_widgets/custom.dart';
import 'package:womenapp/widgets/home_widgets/emergency.dart';
import 'package:womenapp/widgets/home_widgets/safehome/SafeHome.dart';
import 'package:womenapp/widgets/lifesafe.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //const HomeScreen({super.key});
  int qIndex = 0;

  getRandomQuote() {
    Random random = Random();
    setState(() {
      qIndex = random.nextInt(5);
    });
  }

  @override
  void initState() {
    getRandomQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomAppbar(
                quoteIndex: qIndex,
                onTap: () {
                  getRandomQuote();
                }),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  CustomCarouel(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Emergency",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Emergency(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Explore LifeSafe",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  LifeSafe(),
                  SafeHome(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
