import 'package:app/dbPlanning.dart';
import 'package:app/listPage.dart';
import 'package:app/planningModel.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final formKey = GlobalKey<FormState>();
  final profController = TextEditingController();
  final matiereController = TextEditingController();
  DateTime dateHeureCoursController = DateTime.now();
  final dureeCoursController = TextEditingController();


  @override
  void dispose(){
    profController.dispose();
    matiereController.dispose();
    // dateHeureCoursController.dispose();
    dureeCoursController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                bottom: 8.0,
                left: 16.0,
                right: 16.0
              ),
              child: TextFormField(
                controller: profController,
                decoration: const InputDecoration(
                  labelText: 'Professeur',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                  )
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Saisir le nom du professeur';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 8.0,
                  left: 16.0,
                  right: 16.0
              ),
              child: TextFormField(
                controller: matiereController,
                decoration: const InputDecoration(
                    labelText: 'Matiere',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                    )
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Saisir matiere';
                  }
                  return null;
                },
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 8.0,
                  left: 16.0,
                  right: 16.0
              ),
              child: TextField(
                controller: dateHeureCoursController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Select Date"
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100)
                  );

                  if(pickedDate != null){
                    setState(() {
                      dateHeureCoursController.text = pickedDate.toUtc().toString();
                    });
                  }
                },
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 8.0,
                  left: 16.0,
                  right: 16.0
              ),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'Date et heures de cours',
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  setState(() {
                    dateHeureCoursController = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 8.0,
                  left: 16.0,
                  right: 16.0
              ),
              child: TextFormField(
                controller: dureeCoursController,
                decoration: const InputDecoration(
                    labelText: 'Duree',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                    )
                ),
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Saisir le duree du cours';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    final prof = profController.text;
                    final matiere = matiereController.text;
                    final dateHeureCours = dateHeureCoursController;
                    final dureeCours = dureeCoursController.text;
                    PlanningModel planning = PlanningModel( 999, prof, matiere, DateTime.now().toString(), dateHeureCours.toString(), int.parse(dureeCours));
                    DbPlanning.instance.insertPlanning(planning);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListPage()
                        )
                    );


                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Data: $prof, $matiere, $dateHeureCours, $dureeCours"))
                    );
                  }
                },
                style: const ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Colors.orangeAccent),
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0))
                        )
                    )
                ),
                child: const Text(
                  'Sauvegarder',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
