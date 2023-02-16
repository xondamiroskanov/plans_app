import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PLansModalSheet extends StatefulWidget {
  final Function plansAdd;

  PLansModalSheet(this.plansAdd);

  @override
  State<PLansModalSheet> createState() => _PLansModalSheetState();
}

class _PLansModalSheetState extends State<PLansModalSheet> {
  DateTime? chooseNowCalander;
  final TextEditingController textController = TextEditingController();

  void plansInputCalendar(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    ).then((chooseCalander) {
      if (chooseCalander != null) {
        setState(() {
          chooseNowCalander = chooseCalander;
        });
      }
    });
  }

  void submit() {
    if (textController.text.isEmpty || chooseNowCalander == null) {
      return;
    }
    widget.plansAdd(textController.text, chooseNowCalander);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? MediaQuery.of(context).viewInsets.bottom
                : 300),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: "Rejani qoshing",
              ),
              controller: textController,
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    chooseNowCalander == null
                        ? "Reja kuni tanlanmagan"
                        : "${DateFormat("d,MMMM").format(chooseNowCalander!)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black45),
                  ),
                  TextButton(
                    onPressed: () {
                      plansInputCalendar(context);
                    },
                    child: const Text(
                      "Kuni kiritish",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.lightBlue),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Bekor qilish",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: submit,
                      child: const Text(
                        "Kiritish",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
