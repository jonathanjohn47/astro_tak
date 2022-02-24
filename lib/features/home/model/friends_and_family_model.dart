class FriendsAndFamilyModel {
  String name;
  String dateOfBirth;
  String monthOfBirth;
  String yearOfBirth;
  String hourOfBirth;
  String minuteOfBirth;
  String placeOfBirth;
  String gender;
  String relation;

  FriendsAndFamilyModel(
      {required this.name,
      required this.dateOfBirth,
      required this.monthOfBirth,
      required this.yearOfBirth,
      required this.hourOfBirth,
      required this.minuteOfBirth,
      required this.placeOfBirth,
      required this.gender,
      required this.relation});

  factory FriendsAndFamilyModel.fromJson(Map<String, dynamic> json) {
    return FriendsAndFamilyModel(
        name: json['name'],
        dateOfBirth: json['dateOfBirth'],
        monthOfBirth: json['monthOfBirth'],
        yearOfBirth: json['yearOfBirth'],
        hourOfBirth: json['hourOfBirth'],
        minuteOfBirth: json['minuteOfBirth'],
        placeOfBirth: json['placeOfBirth'],
        gender: json['gender'],
        relation: json['relation']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'dateOfBirth': dateOfBirth,
        'monthOfBirth': monthOfBirth,
        'yearOfBirth': yearOfBirth,
        'hourOfBirth': hourOfBirth,
        'minuteOfBirth': minuteOfBirth,
        'placeOfBirth': placeOfBirth,
        'gender': gender,
        'relation': relation
      };
}
