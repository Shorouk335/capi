import 'package:flutter/material.dart';


import 'package:url_launcher/url_launcher.dart';

class WebDevelopmentBasics extends StatefulWidget {
  const WebDevelopmentBasics({Key? key}) : super(key: key);

  @override
  _WebDevelopmentBasicsState createState() => _WebDevelopmentBasicsState();
}

class _WebDevelopmentBasicsState extends State<WebDevelopmentBasics> {
  TextStyle style = TextStyle(fontSize: 20,fontFamily: 'Comfort');

  TextStyle style2 = TextStyle(fontSize: 25, fontFamily: 'Comfort');
  TextStyle label = TextStyle(fontSize: 18, fontFamily: 'Comfort');
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        title: Text('Web Development Basics',style: TextStyle(fontSize: 22,color: Colors.black, fontFamily: 'Comfort')),
        centerTitle: true,
        foregroundColor: Colors.black,

      ),
      body: Center(

        child: Stepper(
          type: StepperType.vertical,
          controlsBuilder: (BuildContext context,ControlsDetails? controlDetails ,
              {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: onStepContinue,
                  child: Text(
                    'Next',
                    style: label,
                  ),
                ),
                SizedBox(width: 15,),
                TextButton(
                  onPressed: onStepCancel,
                  child: Text(
                    'Previous',
                    style: label,
                  ),
                ),
              ],
            );
          },
          steps: [
            Step(
              title: Text(
                'Step 1',
                style: style,
              ),
              content: Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text('Basics of Internet', style: style2)),
                  SizedBox(height: 10,),

                  IconButton(onPressed: () async {
                    const url ='https://www.tutorialspoint.com/basics_of_computer_science/basics_of_computer_science_internet.htm';
                    if (await canLaunch(url)){
                      await launch(url,
                      );
                    } else{
                      throw 'Cant Launch';
                    }
                  }, icon: Image.asset('assets/images/tutorials.png'), iconSize: 50,),
                ],
              ),
              isActive: _currentStep >= 0,
              state: _currentStep == 0 ? StepState.indexed : StepState.complete,),
            Step(
              title: Text(
                'Step 2',
                style: style,
              ),
              content: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Http & Https Protocols', style: style2)),
                  SizedBox(height: 10,),

                  IconButton(onPressed: () async {
                    const url ='https://makersinstitute.gitbooks.io/how-internet-works/content/application-protocols.html';
                    if (await canLaunch(url)){
                      await launch(url,
                      );
                    } else{
                      throw 'Cant Launch';
                    }
                  }, icon: Image.asset('assets/images/mkin.png'), iconSize: 50,),
                ],
              ),
              isActive: _currentStep >= 1,
              state: _currentStep == 1 ?
              StepState.indexed : _currentStep < 1 ? StepState.indexed: StepState.complete,
            ),

            Step(
              title: Text('Step 3', style: style),
              content: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('See Road Map ', style: style2)),

                ],
              ),
              isActive: _currentStep >= 2,
              state: _currentStep == 2 ? StepState.indexed : StepState.indexed,),
          ],

          onStepTapped: (int newIndex) {
            setState(() {
              _currentStep = newIndex;
            });
          },
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep != 2) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
        ),
      ),
    );
  }
}
