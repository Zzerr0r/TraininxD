import 'package:flutter/material.dart';
import 'package:traininxd/model/day.dart';
import 'package:traininxd/model/exercise.dart';
import 'package:traininxd/model/init.dart';

class TrainingsList extends StatefulWidget {

  final Day day;

  const TrainingsList(this.day);



  @override
  State<StatefulWidget> createState() {
    return TrainingsListState();
  }
}

class TrainingsListState extends State<TrainingsList> {

  @override
  Widget build(BuildContext context) {
    Set<TrainingType> traininxList = widget.day.trainings;
    List<Training> trainings = traininxList.map((type) => Init.fromTrainginType(type)).toList();
    return ListView.builder(
        itemCount: traininxList.length,
        itemBuilder: (
        BuildContext context, int i) =>
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              height: 100,
              width: 200,
                child: Center(child: Text(trainings[i].toString()))),
          ),
        )
    );
  }
}
