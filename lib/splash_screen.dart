import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
    color: Colors.black,
    letterSpacing: 3,
  ));

  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Center(
                  child: Text(
                'TIC TAC TOE',
                style: myNewFontWhite,
              ))),
          Expanded(
            flex: 2,
              child: AvatarGlow(
                endRadius: 140,
                duration: const Duration(seconds: 2),
                repeat: true,
                repeatPauseDuration: const Duration(seconds: 1),
                startDelay: const Duration(seconds: 1),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      style: BorderStyle.none
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[800],
                    radius: 80.0,
                    child: Image.asset(
                      'assets/images/game.png',
                      fit: BoxFit.scaleDown,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
          Expanded(
              child: Center(
                  child: Text(
                '@MS HASAN',
                style: myNewFontWhite,
              ))),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Text('PLAY GAME', style: myNewFont,),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
