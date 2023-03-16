import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/splash_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  bool xTurn = false;
  var oPlayerWin = 0;
  var xPlayerWin = 0;
  var fullBoxed = 0;
  bool getWinner = false;

  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
    color: Colors.black,
    letterSpacing: 3,
  ));

  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 20));

  final List<String> displayValue = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void tapAction(int index) {
    setState(() {
      if (oTurn && displayValue[index] == '') {
        displayValue[index] = 'o';
        oTurn = false;
        xTurn = true;
        fullBoxed += 1;
      } else if (xTurn && displayValue[index] == '') {
        displayValue[index] = 'x';
        oTurn = true;
        xTurn = false;
        fullBoxed += 1;
      }

      winnerCheck();
    });
  }

  void winnerCheck() {
    //first row
    if (displayValue[0] == displayValue[1] &&
        displayValue[0] == displayValue[2] &&
        displayValue[0] != '') {
      showDialogBox(displayValue[0]);
      getWinner = true;
    }

    //second row
    if (displayValue[3] == displayValue[4] &&
        displayValue[3] == displayValue[5] &&
        displayValue[3] != '') {
      showDialogBox(displayValue[3]);
      getWinner = true;
    }
    //third row
    if (displayValue[6] == displayValue[7] &&
        displayValue[6] == displayValue[8] &&
        displayValue[6] != '') {
      showDialogBox(displayValue[6]);
      getWinner = true;
    }

    //first column
    if (displayValue[0] == displayValue[3] &&
        displayValue[0] == displayValue[6] &&
        displayValue[0] != '') {
      showDialogBox(displayValue[0]);
      getWinner = true;
    }

    //second column
    if (displayValue[1] == displayValue[4] &&
        displayValue[1] == displayValue[7] &&
        displayValue[1] != '') {
      showDialogBox(displayValue[1]);
      getWinner = true;
    }

    //third column
    if (displayValue[2] == displayValue[5] &&
        displayValue[2] == displayValue[8] &&
        displayValue[2] != '') {
      showDialogBox(displayValue[2]);
      getWinner = true;
    }

    //first diagonal
    if (displayValue[0] == displayValue[4] &&
        displayValue[0] == displayValue[8] &&
        displayValue[0] != '') {
      showDialogBox(displayValue[0]);
      getWinner = true;
    }

    //second diagonal
    if (displayValue[2] == displayValue[4] &&
        displayValue[2] == displayValue[6] &&
        displayValue[2] != '') {
      showDialogBox(displayValue[2]);
      getWinner = true;
    }
    if (!getWinner && fullBoxed == 9) {
      showDialogBox('Draw game');
    }
  }

  showDialogBox(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: !getWinner && fullBoxed == 9
                ? Text(
                    winner,
                    style: myNewFont,
                  )
                : Text(
                    'Winner! ${winner.toUpperCase()}',
                    style: myNewFont,
                  ),
            content: Text(
              'Play again?',
              style: myNewFont,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    clearBroad();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MySplashScreen()));
                  },
                  child: Text(
                    'No',
                    style: myNewFont,
                  )),
              ElevatedButton(
                  onPressed: () {
                    clearBroad();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Yse',
                    style: myNewFont,
                  )),
            ],
          );
        });

    if (winner == 'o') {
      oPlayerWin += 1;
    } else if (winner == 'x') {
      xPlayerWin += 1;
    }
  }

  void clearBroad() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayValue[i] = '';
      }
      fullBoxed = 0;
      getWinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Player X',
                    style: myNewFontWhite,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    xPlayerWin.toString(),
                    style: myNewFontWhite,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Player O',
                    style: myNewFontWhite,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    oPlayerWin.toString(),
                    style: myNewFontWhite,
                  ),
                ],
              ),
            ],
          )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        tapAction(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(-5,-5),
                                blurRadius: 15,
                                spreadRadius: 1
                            )
                          ],
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                            child: Text(
                          displayValue[index],
                          style: myNewFontWhite,
                        )),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                'TIC TAC TOE',
                style: myNewFontWhite,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '@MS HASAN',
                style: myNewFontWhite,
              )
            ],
          )),
        ],
      ),
    );
  }
}
