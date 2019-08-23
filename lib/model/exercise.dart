
import 'package:traininxd/main.dart';
import 'package:traininxd/model/savable.dart';

import 'day.dart';
import 'init.dart';

class Training extends Savable{
  int weight;
  final TrainingType training;
  final int repetitions;
  final int sets;

  @override
  void save(){
    this.saveValue = weight.toString();
    super.save();
  }

   void read() async {
    String weightString = await Savable.read(this.saveString);
    this.weight = weightString == null ? 50 : int.parse(weightString);
  }

   Training(this.training, this.repetitions, this.sets) {
    this.saveString = training.toString();
    this.read();
  }

  void addWeight(int weight){
    this.weight += weight;
  }

  @override
  String toString() {
    return stringFromEnumString(training.toString());
  }

}

const List<DayType> dayCycle = [
  DayType.push,DayType.pull,DayType.leg
];



