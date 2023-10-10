import 'package:app/planningModel.dart';
import 'package:flutter/material.dart';

class DetailPlanning extends StatelessWidget {
  const DetailPlanning({super.key, required this.planningModel});
  final PlanningModel planningModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orangeAccent),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Container(
            width: double.infinity,
            child: ListView(
              children: [
                Card(
                  elevation: 1.8,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.black45),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.orange,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                    Icons.drive_file_rename_outline_sharp,
                                    color: Colors.orange,
                                    size: 14
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: const Color(0xFFDDE6ED),
                            child: Image.asset('images/university.png')
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.calendar_month),
                                        Text(
                                            // 'Date: ${planningModel.dateHeuresCours.day}/${planningModel.dateHeuresCours.month}/${planningModel.dateHeuresCours.year}'
                                            'Date: ${planningModel.dateHeuresCours}'
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time),
                                      Text(
                                          // 'Debut: ${planningModel.dateHeuresCours.hour}h${planningModel.dateHeuresCours.minute}')
                                          'Debut: ${planningModel.dateHeuresCours}')
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.timelapse),
                                  Text('${planningModel.dureeCours}h'),
                                ],
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                planningModel.matiere,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Text(
                                'Par: ${planningModel.prof}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16.0,
                                    color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('A propos:'),
                              Text(
                                // 'Reserver le: ${planningModel.dateReservation.day}/${planningModel.dateReservation.month}/${planningModel.dateReservation.year}',
                                'Reserver le: ${planningModel.dateReservation}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                // 'A : ${planningModel.dateReservation.hour}h: ${planningModel.dateReservation.minute}min: ${planningModel.dateReservation.second}sec',
                                'A : ${planningModel.dateReservation}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
