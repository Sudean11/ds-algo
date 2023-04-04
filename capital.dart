// ignore_for_file: public_member_api_docs, sort_constructors_first
City? headNode;
List<City> cityHeads = [];

main() {
  List<List<String>> route = [
    ["qMTSlfgZlC", "ePvzZaqLXj"],
    ["xKhZXfuBeC", "TtnllZpKKg"],
    ["ePvzZaqLXj", "sxrvXFcqgG"],
    ["sxrvXFcqgG", "xKhZXfuBeC"],
    ["TtnllZpKKg", "OAxMijOZgW"]
  ];
  headNode = City(value: route[0][0]);
  cityHeads.add(headNode!);
  for (var singleRoute in route) {
    createRoute(singleRoute, headNode);
  }
  viewRoute(headNode);
}

void viewRoute(City? head) {
  print(head?.value);
  if (head?.city != null) {
    viewRoute(head?.city);
  }
}

City getOrCreateCity(String city, bool isHead) {
  for (City head in cityHeads) {
    City? result = searchInGraphs(city, head);
    if (result != null) {
      return result;
    }
  }
  City newHeadCity = City(value: city);
  if (isHead) {
    cityHeads.add(newHeadCity);
  }
  return newHeadCity;
}

City? searchInGraphs(String city, City? head) {
  if (head == null) {
    City? newHeadCity = null;
    return newHeadCity;
  }
  // if (head.value == city) {
  //   return head;
  // } else {
  //   return searchInGraphs(city, head.city);
  // }
  while (head != null) {
    if (head.value == city) {
      return head;
    }
    head = head.city;
  }
  return null;
}

createRoute(List<String> route, City? head) {
  // var FromCity = route[0]

  if (head?.value == route[1]) {
    City newHead = City(value: route[0]);
    newHead.city = head;
    headNode = newHead;
  }

  City endCity = getOrCreateCity(route[1], false);
  getOrCreateCity(route[0], true).city = endCity;

  // print(fromCity.value);
  // print(toCity.value);
}

void checkIfInExistingGraph(String route, String route2) {}

class City {
  String value;
  City? city;
  City({
    required this.value,
  });
}
