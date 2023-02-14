import 'package:flutter/material.dart';

import '../../models/plans_model.dart';
class PlansNumber extends StatelessWidget {
final List<PlansModel> plans;
PlansNumber(this.plans);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               plans.length.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const Text(
                "Rejalar soni",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                plans.where((element) =>element.toogleDone ).length.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const  Text(
                "Bajarilgan rejalar",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );;
  }
}
