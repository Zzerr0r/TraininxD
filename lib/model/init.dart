
import 'exercise.dart';

class Init {
  static  Training Bankdruecken;
  static  Training Schulterdruecken;
  static  Training Pushdowns;
  static  Training Seitheben;
  static  Training RomanianDL;
  static  Training PullDowns ;
  static  Training CableRows;
  static  Training FacePulls;
  static  Training Squat;
  static  Training LegPress;
  static  Training LegCurls;
  static  Training CalfRaises;

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

  static void init(){
    Bankdruecken      =  Training(TrainingType.Bankdruecken,3,3);
    Schulterdruecken  =  Training(TrainingType.Schulterdruecken,3,3);
    Pushdowns         =  Training(TrainingType.Pushdowns,3,3);
    Seitheben         =  Training(TrainingType.Seitheben,3,3);
    RomanianDL        =  Training(TrainingType.RomanianDL,3,3);
    PullDowns         =  Training(TrainingType.PullDowns,3,3);
    CableRows         =  Training(TrainingType.CableRows,3,3);
    FacePulls         =  Training(TrainingType.FacePulls,3,3);
    Squat             =  Training(TrainingType.Squat,3,3);
    LegPress          =  Training(TrainingType.LegPress,3,3);
    LegCurls          =  Training(TrainingType.LegCurls,3,3);
    CalfRaises        =  Training(TrainingType.CalfRaises,3,3);
  }

  static Training fromTrainginType(TrainingType type){
    return map[type];
  }
}

enum TrainingType{
  Bankdruecken,Schulterdruecken,Pushdowns,Seitheben,
  RomanianDL,PullDowns,CableRows,FacePulls,
  Squat,LegPress,LegCurls,CalfRaises
}
