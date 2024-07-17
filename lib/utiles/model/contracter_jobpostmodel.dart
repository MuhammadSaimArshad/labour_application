// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Contracter_jobpostmodel {
  String? jobtitle;
  String? description;
  String? category;
  String? hourlyprice;
  String? date;
  String? time;
  String? id;
  String? name;
  String? contactorID;
  String? wotrkeridID;
  String? status;
  Contracter_jobpostmodel({
    this.jobtitle,
    this.description,
    this.category,
    this.hourlyprice,
    this.date,
    this.time,
    this.id,
    this.name,
    this.contactorID,
    this.wotrkeridID,
    this.status,
  });

  Contracter_jobpostmodel copyWith({
    String? jobtitle,
    String? description,
    String? category,
    String? hourlyprice,
    String? date,
    String? time,
    String? id,
    String? name,
    String? contactorID,
    String? wotrkeridID,
    String? status,
  }) {
    return Contracter_jobpostmodel(
      jobtitle: jobtitle ?? this.jobtitle,
      description: description ?? this.description,
      category: category ?? this.category,
      hourlyprice: hourlyprice ?? this.hourlyprice,
      date: date ?? this.date,
      time: time ?? this.time,
      id: id ?? this.id,
      name: name ?? this.name,
      contactorID: contactorID ?? this.contactorID,
      wotrkeridID: wotrkeridID ?? this.wotrkeridID,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobtitle': jobtitle,
      'description': description,
      'category': category,
      'hourlyprice': hourlyprice,
      'date': date,
      'time': time,
      'id': id,
      'name': name,
      'contactorID': contactorID,
      'wotrkeridID': wotrkeridID,
      'status': status,
    };
  }

  factory Contracter_jobpostmodel.fromMap(Map<String, dynamic> map) {
    return Contracter_jobpostmodel(
      jobtitle: map['jobtitle'] != null ? map['jobtitle'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      hourlyprice:
          map['hourlyprice'] != null ? map['hourlyprice'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      contactorID:
          map['contactorID'] != null ? map['contactorID'] as String : null,
      wotrkeridID:
          map['wotrkeridID'] != null ? map['wotrkeridID'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contracter_jobpostmodel.fromJson(String source) =>
      Contracter_jobpostmodel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Contracter_jobpostmodel(jobtitle: $jobtitle, description: $description, category: $category, hourlyprice: $hourlyprice, date: $date, time: $time, id: $id, name: $name, contactorID: $contactorID, wotrkeridID: $wotrkeridID, status: $status)';
  }

  @override
  bool operator ==(covariant Contracter_jobpostmodel other) {
    if (identical(this, other)) return true;

    return other.jobtitle == jobtitle &&
        other.description == description &&
        other.category == category &&
        other.hourlyprice == hourlyprice &&
        other.date == date &&
        other.time == time &&
        other.id == id &&
        other.name == name &&
        other.contactorID == contactorID &&
        other.wotrkeridID == wotrkeridID &&
        other.status == status;
  }

  @override
  int get hashCode {
    return jobtitle.hashCode ^
        description.hashCode ^
        category.hashCode ^
        hourlyprice.hashCode ^
        date.hashCode ^
        time.hashCode ^
        id.hashCode ^
        name.hashCode ^
        contactorID.hashCode ^
        wotrkeridID.hashCode ^
        status.hashCode;
  }
}
