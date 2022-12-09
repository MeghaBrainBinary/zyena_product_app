import 'package:flutter/material.dart';
import 'package:product_app/game/constants.dart';
import 'package:product_app/game/models/responsive_ui.dart';
import 'package:product_app/game/models/settings.dart';
import 'package:product_app/game/screens/welcome/components/scaffold_body.dart';
import 'package:product_app/game/utilities/audio_player.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    if (Settings.audioValues[1]) AudioPlayer.playMusic();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveUI.getDeviceHeight(context);
    ResponsiveUI.getDeviceWidth(context);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: MyScaffoldBody(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      centerTitle: true,
      title: Text(
        'TIC TAC TOE',
        textAlign: TextAlign.center,
        style: kTextStyle.copyWith(
          fontSize: ResponsiveUI.getFontSize(33.0),
        ),
      ),
      leading: Container(),
      // leading: IconButton(
      //   color: kTextColor,
      //   iconSize: ResponsiveUI.getFontSize(35.0),
      //   padding: const EdgeInsets.all(0.0),
      //   onPressed: () => MyAlertDialog.buildAlert(context),
      //   icon: const Icon(Icons.menu),
      // ),
    );
  }
}
