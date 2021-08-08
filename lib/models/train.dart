class Train {
  String? name;
  String? coachType;
  String? number;
  List<String>? locations;

  Train({this.name, this.coachType, this.number, this.locations});

  Train.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    coachType = json['coachType'];
    number = json['number'];
    locations = json['locations'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['coachType'] = this.coachType;
    data['number'] = this.number;
    data['locations'] = this.locations;
    return data;
  }
}