import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:womenapp/widgets/home_widgets/life_safe/HospitalCard.dart';
import 'package:womenapp/widgets/home_widgets/life_safe/PharmacyCard.dart';
import 'package:womenapp/widgets/home_widgets/life_safe/policestationcard.dart';

class LifeSafe extends StatelessWidget {
  const LifeSafe({super.key});

  static Future<void> openMap(String location) async {
    String googleUrl = 'https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(msg: 'something went wrong!! call emergency');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            PoliceStationCard(onMapFunction: openMap),
            HospitalCard(onMapFunction: openMap),
            PharmacyCard(onMapFunction: openMap),
          ],
        ));
  }
}
