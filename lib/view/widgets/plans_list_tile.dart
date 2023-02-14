import 'package:flutter/material.dart';
import 'package:plans_app/models/plans_model.dart';

class PlansListTile extends StatelessWidget {
  final PlansModel pM;
  final Function done;
  final Function deletePlans;
  PlansListTile(this.pM, this.done,this.deletePlans);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      leading: IconButton(
        onPressed: () {
          done(pM.id);
        },
        icon: pM.toogleDone
            ? const Icon(
                Icons.check_circle_outline,
                color: Colors.lightGreen,
              )
            : Icon(
                Icons.circle_outlined,
                color: Colors.lightBlue,
              ),
      ),
      title: Text(
        // plansInformation[index].plansName,
        // style: plansInformation[index].toogleDone
        //     ? const TextStyle(
        //         fontWeight: FontWeight.bold,
        //         decoration: TextDecoration.lineThrough,
        //         color: Colors.black45,
        // )
        //     : const TextStyle(
        //         fontWeight: FontWeight.bold,
        //       ),
        pM.plansName,
        style: pM.toogleDone
            ? const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
                color: Colors.black45,
              )
            : const TextStyle(
                fontWeight: FontWeight.bold,
              ),
      ),
      trailing: IconButton(
        onPressed: () {
          deletePlans(pM.id);
        },
        icon: const Icon(Icons.delete_forever_rounded),
      ),
    );
  }
}
