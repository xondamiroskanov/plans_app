import 'package:flutter/material.dart';
import 'package:plans_app/view/widgets/plans_date.dart';
import 'package:plans_app/view/widgets/plans_number.dart';
import 'package:plans_app/models/plans_model.dart';
import '../widgets/plans_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PlansModel> _plansModel = PlansInformation().plansList;
  DateTime? _nowDateChoose = DateTime.now();

  void _dateChoos(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2023, 12, 31),
    ).then((choosDay) {
      setState(() {
        if (choosDay != null) {
          _nowDateChoose = choosDay;
        }
      });
    });
  }

  void _previousDay() {
    setState(() {
      _nowDateChoose = DateTime(
          _nowDateChoose!.year, _nowDateChoose!.month, _nowDateChoose!.day - 1);
    });
  }

  void _nextDay() {
    setState(() {
      _nowDateChoose = DateTime(
          _nowDateChoose!.year, _nowDateChoose!.month, _nowDateChoose!.day + 1);
    });
  }

  void _done(String myId) {
    setState(() {
      _plansModel.firstWhere((element) => element.id == myId).toogleDoneFunc();
    });
    print(myId);

  }
  void _plansDelete(String id) {
    setState(() {
      _plansModel.removeWhere((deleteId) {
        return deleteId.id == id;
      });

    });
  }


  @override
  Widget build(BuildContext context) {
    // print(plansModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rejalar dasturi",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          PlansDate(
            _dateChoos,
            _nowDateChoose!,
            _nextDay,
            _previousDay,
          ),

          PlansNumber(_plansModel),
          PlansList(_plansModel, _done,_plansDelete),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
