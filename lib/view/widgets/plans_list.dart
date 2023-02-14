import 'package:flutter/material.dart';
import 'package:plans_app/models/plans_model.dart';
import 'plans_list_tile.dart';
class PlansList extends StatelessWidget {



  // final plansInformation = PlansInformation().plansList;
  final List<PlansModel> plans;
  final Function done;
  final Function deletePlans;
  PlansList(this.plans,this.done,this.deletePlans);



  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
          itemCount: plans.length,
          // plansInformation.length,
          itemBuilder: (context, index) {
            return PlansListTile(plans[index],done,deletePlans);
          }),
    );
  }
}
