import 'package:flutter/material.dart';
import 'package:womenapp/widgets/home_widgets/emergencies.dart/ambulanceemergency.dart';
import 'package:womenapp/widgets/home_widgets/emergencies.dart/firebrigadeemergency.dart';
import 'package:womenapp/widgets/home_widgets/emergencies.dart/policeemergency.dart';
// import 'package:womenapp/widgets/home_widgets/emergencies/policeemergency.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceEmergency(),
          AmbulanceEmergency(),
          FireBrigadeEmergency(),
        ],
      ),
    );
  }
}
