import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color primary = Color(0xffb485f9);
  int currentstep = 0;
  bool initilized = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => setState(() {
              initilized = true;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff151646),
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Measurment"),
          ],
        ),
        actions: [
          Center(
            child: Text("Smith, Bob(101A)"),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            color: primary,
            child: Center(
              child: Stepper(
                margin: EdgeInsets.all(0),
                currentStep: currentstep,
                type: StepperType.vertical,
                steps: getSteps(),
                onStepContinue: () {
                  final isLastStep = currentstep == getSteps().length - 1;
                  if (isLastStep) {
                    print("Complet");
                  } else {
                    setState(() {
                      currentstep += 1;
                    });
                  }
                },
                onStepCancel: currentstep == 0
                    ? null
                    : () => setState(() {
                          currentstep -= 1;
                        }),
                controlsBuilder: (context, details) {
                  return SizedBox(
                    height: 0,
                  );
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [initilized ? temperature() : initialize()],
            ),
          ),
        ],
      ),
    );
  }

  //Stepper Step List
  List<Step> getSteps() => [
        Step(
          isActive: currentstep >= 0,
          title: Text("Temperature"),
          content: Container(),
        ),
        Step(
          isActive: currentstep >= 1,
          title: Text("Blood Pressure + Pulse"),
          content: Container(),
        ),
        Step(
          isActive: currentstep >= 2,
          title: Text("Plus Oximeter"),
          content: Container(),
        ),
        Step(
          isActive: currentstep >= 3,
          title: Text("Check and Confirm"),
          content: Container(),
        ),
      ];

//Initialize Container
  Container initialize() {
    return Container(
      padding: EdgeInsets.all(20),
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.grey),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Initialize the Thermometer",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Press the power button in the top row once and hit START once the device is <10cm from the forhead Hold still and wait for a sound. Once you get valid reading on the screen proceed.",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

//Processing Container
  Container temperature() {
    return Container(
        padding: EdgeInsets.all(20),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.grey),
          ],
        ),
        child: Stack(
          children: [
            Align(
                alignment: Alignment(-1, -1),
                child: Text(
                  "Temperature",
                  style: TextStyle(fontSize: 22),
                )),
            Align(
              alignment: Alignment(0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "97.8",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "'F",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment(1, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "RETRY",
                        style: TextStyle(
                            color: primary, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: primary, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
