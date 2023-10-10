import 'package:app/dbPlanning.dart';
import 'package:app/forms.dart';
import 'package:app/planningModel.dart';
import 'package:flutter/material.dart';

import 'cardItemPlanning.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 50),
        child: FutureBuilder<List<PlanningModel>>(
          future: DbPlanning.instance.listPlannings(),
          builder: (BuildContext context,AsyncSnapshot<List<PlanningModel>> snapshot){
            if(snapshot.hasData){
              List<PlanningModel>? listPlanning = snapshot.data;
              return ListView.builder(
                itemCount: listPlanning?.length,
                itemBuilder: (context, index) {
                  final planningCurrent = listPlanning?[index];
                  return Dismissible(
                      key: Key(planningCurrent!.prof),
                      onDismissed: (directtion){
                        setState(() {
                          DbPlanning.instance.deletePlanning(planningCurrent.id);
                          listPlanning?.removeAt(index);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${planningCurrent.id} supprime"))
                        );
                      },
                      background: Container(
                        color: Colors.redAccent,
                        padding: const EdgeInsets.only(right: 10),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete, color: Colors.white),
                          ],
                        ),
                      ),
                      child: CardItemPlanning(planningModel: planningCurrent)
                  );
                },
              );
            }else{
              return const Center(
                child: Text('No Data'),
              );
            }
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Forms()
              )
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
