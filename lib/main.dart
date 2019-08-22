import 'package:flutter/material.dart';

import 'model/day.dart';

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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Day day;

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

    if(day != null) return Text("Your Day is ${stringFromEnumString(day.momentary.toString())}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text("select your current trainingxDay"),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: daySelectButton(DayType.push),
        ),
        daySelectButton(DayType.pull),
        daySelectButton(DayType.leg),
      ],
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
}

String stringFromEnumString(String enumString){
  return enumString.split(".")[1];
}
