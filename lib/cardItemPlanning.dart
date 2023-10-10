import 'package:app/detailPlannig.dart';
import 'package:app/planningModel.dart';
import 'package:flutter/material.dart';

class CardItemPlanning extends StatelessWidget {
  const CardItemPlanning({super.key, required this.planningModel});
  final PlanningModel planningModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPlanning(planningModel: planningModel),
            )
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 4),
        elevation: 1.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.black45)
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Date:${planningModel.dateHeuresCours.day}/${planningModel.dateHeuresCours.month}/${planningModel.dateHeuresCours.year} a ${planningModel.dateHeuresCours.hour}h${planningModel.dateHeuresCours.minute}',style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Date:${planningModel.dateHeuresCours}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Text('prof: ${planningModel.prof} / matiere: ${planningModel.matiere}', style: const TextStyle(fontWeight: FontWeight.w300),)
                ],
              ),
              IconButton(
                /*style: ButtonStyle(
                  // backgroundColor: const MaterialStatePropertyAll(Colors.orangeAccent),
                  shape: MaterialStatePropertyAll<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                  )
                ),*/
                  onPressed: (){}, 
                  icon: const Icon(Icons.more_vert,color: Colors.black87,)
              )
            ],
          ),
        ),
      ),
    );
  }
}
