
import 'package:flutter/material.dart';
import 'package:plans_app/view/widgets/plans_date.dart';
import 'package:plans_app/view/widgets/plans_number.dart';

import '../widgets/plans_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
DateTime? nowDateChoose = DateTime.now();

  void dateChoos(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2023,12,31),
    ).then((choosDay) {
      setState(() {
        if(choosDay != null){
          nowDateChoose = choosDay;
        }
      });
    });
  }
  void previousDay(){
    setState(() {
      nowDateChoose = DateTime(nowDateChoose!.year,nowDateChoose!.month,nowDateChoose!.day-1);
    });
  }
  void nextDay(){
    setState(() {
      nowDateChoose = DateTime(nowDateChoose!.year,nowDateChoose!.month, nowDateChoose!.day+1);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rejalar dasturi",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          PlansDate(dateChoos,nowDateChoose!,nextDay,previousDay,),
          PlansNumber(),
          PlansList(),
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
