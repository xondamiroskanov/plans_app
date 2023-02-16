class PlansModel {
  final String id;
  final String plansName;
  final DateTime plansDay;
  bool toogleDone = false;

  PlansModel(
      {required this.plansName, required this.plansDay, required this.id});

  void toogleDoneFunc() {
    toogleDone = !toogleDone;
  }
}

class PlansInformation {
  final List<PlansModel> _plansList = [
    PlansModel(
        plansName: "Universitetga borish ", plansDay: DateTime.now(), id: "p1"),
    PlansModel(plansName: "Uyga qaytish ", plansDay: DateTime.now(), id: "p2"),
    PlansModel(plansName: "Ovqat yeyish ", plansDay: DateTime.now(), id: "p3"),
    PlansModel(
        plansName: "Flutter bilan shu'gullanish ",
        plansDay: DateTime.now(),
        id: "p4"),
  ];

  List<PlansModel> get plansList {
    return _plansList;
  }

  void addPlansEnd(String pName, DateTime pDay) {
    _plansList.add(
      PlansModel(
          plansName: pName, plansDay: pDay, id: "${_plansList.length + 1}"),
    );
  }
}
