class PlanningModel {
  int id;
  String prof;
  String matiere;
  String dateReservation;
  String dateHeuresCours;
  int dureeCours;
  PlanningModel(this.id, this.prof, this.matiere, this.dateReservation, this.dateHeuresCours, this.dureeCours);

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'prof': prof,
      'matiere': matiere,
      'dateReservation': dateReservation,
      'dateHeuresCours': dateHeuresCours,
      'dureeCours': dureeCours
    };
  }

  factory PlanningModel.fromMap(Map<String, dynamic> map) => PlanningModel(
      map['id'],
      map['prof'],
      map['matiere'],
      map['dateReservation'],
      map['dateHeuresCours'],
      map['dureeCours']
  );

}