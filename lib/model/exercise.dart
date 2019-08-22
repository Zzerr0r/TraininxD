
import 'day.dart';

class Exercise {
  int weight;
  Training training;
  int repetitions;
  int sets;


  void addWeight(int weight){
    this.weight += weight;
  }

}

const List<DayType> dayCycle = [
  DayType.push,DayType.pull,DayType.leg
];


