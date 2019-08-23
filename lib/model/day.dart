import 'package:traininxd/main.dart';
import 'package:traininxd/model/savable.dart';

import 'init.dart';

class Day extends Savable {

  DayType momentary;

  static const String _saveString = "Day";


  Set<TrainingType> get trainings => DayTrainingMap[momentary];


  Day(this.momentary){
    this.saveString = Day._saveString;
    this.saveValue  = momentary.toString();
  }

  void save() {
    this.saveValue = momentary.toString();
    super.save();
  }

  void next(){
    this.momentary =dayCycle[(dayCycle.indexOf(momentary) + 1) % DayType.values.length];
  }

  static Future<Day> fromStorage () async {
    String read = await Savable.read(Day._saveString);
    if(read == null) return null;
    return Day(dayTypeFromString(read));
  }

  @override
  String toString() {
    return stringFromEnumString(this.momentary.toString());
  }

}

enum DayType{
  push,pull,leg
}



const Map<DayType,Set<TrainingType>> DayTrainingMap = {
  DayType.push : {
    TrainingType.Bankdruecken,TrainingType.Schulterdruecken,TrainingType.Pushdowns,TrainingType.Seitheben,
  },
  DayType.pull : {
    TrainingType.RomanianDL,TrainingType.PullDowns,TrainingType.CableRows,TrainingType.FacePulls,
  },
  DayType.leg : {
    TrainingType.Squat,TrainingType.LegPress,TrainingType.LegCurls,TrainingType.CalfRaises,
  }
};

 const List<DayType> dayCycle = [
  DayType.push,DayType.pull,DayType.leg
];

 TrainingType trainingFromString(String string){
  return TrainingType.values.firstWhere((test) => string == test.toString());
}
 DayType dayTypeFromString(String string){
  return DayType.values.firstWhere((test) => string == test.toString());
}


