import 'package:flutter/material.dart';

class PharmacyCard extends StatelessWidget {
  final Function? onMapFunction;
  const PharmacyCard({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('Medical Stores near me ');
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 231, 219, 219),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      'M.S.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text('Medical Stores') // Added missing bracket here
        ], // Added missing bracket here
      ),
    );
  }
}
