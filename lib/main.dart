import 'package:flutter/material.dart';
import 'package:traininxd/widget/trainings_list.dart';

import 'model/day.dart';
import 'model/init.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TraininxD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TraininxD'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  Day day;
  bool trainingStarted= false;

  @override
  void initState()  {
    Day.fromStorage().then((day) =>
        setState(() => this.day = day)
    );
    setState(() => day = day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Center(child: getBody()),
    );
  }

  Future<Day> getDay() async {
    return await Day.fromStorage();
  }

  Widget getBody()  {

    if(day != null && !trainingStarted) {
      return startTrainingBox();
    }
    if(day != null && trainingStarted) {
      return TrainingsList(day, this);
    }
    return selectDayBox();
  }

  Column selectDayBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text("select your current trainingxDay",style: TextStyle(fontSize: 30),),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: daySelectButton(DayType.push),
        ),
        daySelectButton(DayType.pull),
        daySelectButton(DayType.leg),
      ],
    );
  }

  GestureDetector startTrainingBox() {
    return GestureDetector(
      onTap: () {
        setState(() => this.trainingStarted = true);
        Init.init();
      },
      child: Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text("Start ${(day.toString())} traininxD",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  setDay(Day day) async {
    setState(() => this.day = day);
    day.save();
  }

  Widget daySelectButton(DayType dayType){
    return GestureDetector(
      onTap: () => setDay(Day(dayType)),
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.lightBlue,
            border: Border.all(),
          borderRadius: BorderRadius.circular(15)
        ),
        height: 100,
        width: 200 ,
        child: Center(
          child: Text(stringFromEnumString(dayType.toString()),
            style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }

  void trainingDone(){
    this.day.next();
    setState(() {
      this.trainingStarted = false;
    });
  }

}

String stringFromEnumString(String enumString){
  return enumString.split(".")[1];
}
