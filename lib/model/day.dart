import 'package:traininxd/model/savable.dart';

class Day extends Savable {

  DayType momentary;

  static const String _saveString = "Day";


  Set<Training> get trainings => DayTrainingMap[momentary];


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

}

enum DayType{
  push,pull,leg
}

enum Training{
  Bankdruecken,Schulterdruecken,Pulldowns,Seitheben,
  RomanianDL,PullDowns,CableRows,FacePulls,
  Squat,LegPress,LegCurls,CalfRaises
}

const Map<DayType,Set<Training>> DayTrainingMap = {
  DayType.push : {
    Training.Bankdruecken,Training.Schulterdruecken,Training.Pulldowns,Training.Seitheben,
  },
  DayType.pull : {
    Training.RomanianDL,Training.PullDowns,Training.CableRows,Training.FacePulls,
  },
  DayType.leg : {
    Training.Squat,Training.LegPress,Training.LegCurls,Training.CalfRaises,
  }
};

 const List<DayType> dayCycle = [
  DayType.push,DayType.pull,DayType.leg
];

 Training trainingFromString(String string){
  return Training.values.firstWhere((test) => string == test.toString());
}
 DayType dayTypeFromString(String string){
  return DayType.values.firstWhere((test) => string == test.toString());
}


