import 'package:flutter/material.dart';
import 'package:traininxd/model/day.dart';
import 'package:traininxd/model/exercise.dart';
import 'package:traininxd/model/init.dart';
import 'package:traininxd/widget/trainings_card.dart';

import '../main.dart';

class TrainingsList extends StatefulWidget {

  final Day day;
  final MyHomePageState parentState;

  const TrainingsList(this.day, this.parentState);



  @override
  State<StatefulWidget> createState() {
    return TrainingsListState();
  }
}

class TrainingsListState extends State<TrainingsList> {

  bool trainingDone = false;
  Map<Training,int> weightMap = {};


  @override
  Widget build(BuildContext context) {
    List<Training> trainings = widget.day.trainings;
    trainings.forEach((t)=> weightMap.putIfAbsent(t, ()=> t.weight));
    return ListView.builder(
        itemCount: trainings.length+1,
        itemBuilder: (
        BuildContext context, int i) =>
            i < trainings.length ? TrainingsCard(trainings[i], this)
                : IconButton(
              icon: Icon(Icons.check,
                color: !trainingDone ?Colors.grey : Colors.green,
                size: 40,
              ),
              onPressed: () => done()),
            );
  }

  void done(){
    setState(() {
      this.trainingDone = true;
    });
    this.weightMap.forEach((k,v) {
      k.weight = v;
      k.save();
    });
    Future.delayed(Duration(
      milliseconds: 500
    ),() => widget.parentState.trainingDone());
  }

}
