import 'package:flutter/material.dart';
import 'package:traininxd/model/exercise.dart';
import 'package:traininxd/widget/trainings_list.dart';

class TrainingsCard extends StatefulWidget {
  final Training training;
  final TrainingsListState parentState;

  const TrainingsCard(this.training, this.parentState);

  @override
  State<StatefulWidget> createState() {
    return TrainingsCardState();
  }
}

class TrainingsCardState extends State<TrainingsCard> {
  bool success = false;
  int weightForNextTraining;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 200,
        child: GestureDetector(
          onTap: ()=> this.trainingSuccess(),
          child: Card(
            color: success ? Colors.lightGreen : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            elevation: 10,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(widget.training.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                "Repetitions :  ${widget.training.repetitions}",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),Text(
                              "Sets :  ${widget.training.sets}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Weight : ${widget.training.weight}",
                        style: TextStyle(fontSize: 18),
                      ),
                      !this.success ? Container() :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Weight for next time ",),
                          Padding(
                            padding: const EdgeInsets.only(top : 5),
                            child: Text((this.weightForNextTraining).toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() => this.weightForNextTraining--);
                                  this.widget.parentState.weightMap[this.widget.training] = this.weightForNextTraining;
                                } ,
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() => this.weightForNextTraining++);
                                  this.widget.parentState.weightMap[this.widget.training] = this.weightForNextTraining;
                                } ,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void trainingSuccess(){
    setState(() => this.success = !this.success);
    if(!this.success) this.weightForNextTraining = widget.training.weight;
    else {
      this.weightForNextTraining = (this.weightForNextTraining ?? this.widget.training.weight) +5;
      this.widget.parentState.weightMap[this.widget.training] = this.weightForNextTraining;
    }
  }
}
