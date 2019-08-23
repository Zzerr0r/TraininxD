
import 'exercise.dart';

class Init {
  static  Training Bankdruecken      =  Training(TrainingType.Bankdruecken,3,3);
  static  Training Schulterdruecken  =  Training(TrainingType.Schulterdruecken,3,3);
  static  Training Pushdowns         =  Training(TrainingType.Pushdowns,3,3);
  static  Training Seitheben         =  Training(TrainingType.Seitheben,3,3);
  static  Training RomanianDL        =  Training(TrainingType.RomanianDL,3,3);
  static  Training PullDowns         =  Training(TrainingType.PullDowns,3,3);
  static  Training CableRows         =  Training(TrainingType.CableRows,3,3);
  static  Training FacePulls         =  Training(TrainingType.FacePulls,3,3);
  static  Training Squat             =  Training(TrainingType.Squat,3,3);
  static  Training LegPress          =  Training(TrainingType.LegPress,3,3);
  static  Training LegCurls          =  Training(TrainingType.LegCurls,3,3);
  static  Training CalfRaises        =  Training(TrainingType.CalfRaises,3,3);

  static  Map<TrainingType,Training> map = {
    TrainingType.Bankdruecken : Bankdruecken ,
    TrainingType.Schulterdruecken : Schulterdruecken ,
    TrainingType.Pushdowns: Pushdowns,
    TrainingType.Seitheben: Seitheben,
    TrainingType.RomanianDL : RomanianDL ,
    TrainingType.PullDowns: PullDowns,
    TrainingType.CableRows: CableRows,
    TrainingType.FacePulls: FacePulls,
    TrainingType.Squat: Squat,
    TrainingType.LegPress: LegPress,
    TrainingType.LegCurls : LegCurls ,
    TrainingType.CalfRaises : CalfRaises ,
  };

  static Training fromTrainginType(TrainingType type){
    return map[type];
  }
}

enum TrainingType{
  Bankdruecken,Schulterdruecken,Pushdowns,Seitheben,
  RomanianDL,PullDowns,CableRows,FacePulls,
  Squat,LegPress,LegCurls,CalfRaises
}
