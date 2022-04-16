import 'package:flutter/material.dart';

import '../../../core/constants/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Strings.homeScreenCenterText,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
