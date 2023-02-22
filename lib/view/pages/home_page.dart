import 'package:flutter/material.dart';
import 'package:plans_app/view/widgets/plans_date.dart';
import 'package:plans_app/view/widgets/plans_modal_sheet.dart';
import 'package:plans_app/view/widgets/plans_number.dart';
import 'package:plans_app/models/plans_model.dart';
import '../widgets/plans_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlansInformation _plansModel = PlansInformation();
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
      _plansModel
          .plansByDy(_nowDateChoose!)
          .firstWhere((element) => element.id == myId)
          .toogleDoneFunc();
    });
  }

  void _plansDelete(String id) {
    setState(() {
      _plansModel.plansList.removeWhere((deleteId) {
        return deleteId.id == id;
      });
    });
  }

  void _plansAdd(String plansname, DateTime time) {
    setState(() {
      _plansModel.addPlansEnd(plansname, time);
    });
    Navigator.of(context).pop();
  }

  void plansAddDisplay(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return PLansModalSheet(_plansAdd);
        });
  }

  @override
  Widget build(BuildContext context) {
    // print(_plansModel);
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
          PlansNumber(_plansModel.plansByDy(_nowDateChoose!)),
          PlansList(
              _plansModel.plansByDy(_nowDateChoose!), _done, _plansDelete),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        onPressed: () {
          plansAddDisplay(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
