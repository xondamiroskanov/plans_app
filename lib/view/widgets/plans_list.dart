import 'package:flutter/material.dart';
 class PlansList extends StatelessWidget {
  const PlansList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.circle_outlined),
              ),
              title: Text(
                "Universitetga borish",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete_forever_rounded),
              ),
            );
          }),
    );
  }
}
