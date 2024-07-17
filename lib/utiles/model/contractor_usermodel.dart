// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Contractorusermodel {
  String? uname;
  String? email;
  String? password;
  String? cnfpassword;
  String? uid;
  String? phoneNO;
  String? company;
  String? adress;
  String? time;
  String? contractertokenID;
  Contractorusermodel({
    this.uname,
    this.email,
    this.password,
    this.cnfpassword,
    this.uid,
    this.phoneNO,
    this.company,
    this.adress,
    this.time,
    this.contractertokenID,
  });

  Contractorusermodel copyWith({
    String? uname,
    String? email,
    String? password,
    String? cnfpassword,
    String? uid,
    String? phoneNO,
    String? company,
    String? adress,
    String? time,
    String? contractertokenID,
  }) {
    return Contractorusermodel(
      uname: uname ?? this.uname,
      email: email ?? this.email,
      password: password ?? this.password,
      cnfpassword: cnfpassword ?? this.cnfpassword,
      uid: uid ?? this.uid,
      phoneNO: phoneNO ?? this.phoneNO,
      company: company ?? this.company,
      adress: adress ?? this.adress,
      time: time ?? this.time,
      contractertokenID: contractertokenID ?? this.contractertokenID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uname': uname,
      'email': email,
      'password': password,
      'cnfpassword': cnfpassword,
      'uid': uid,
      'phoneNO': phoneNO,
      'company': company,
      'adress': adress,
      'time': time,
      'contractertokenID': contractertokenID,
    };
  }

  factory Contractorusermodel.fromMap(Map<String, dynamic> map) {
    return Contractorusermodel(
      uname: map['uname'] != null ? map['uname'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      cnfpassword:
          map['cnfpassword'] != null ? map['cnfpassword'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      phoneNO: map['phoneNO'] != null ? map['phoneNO'] as String : null,
      company: map['company'] != null ? map['company'] as String : null,
      adress: map['adress'] != null ? map['adress'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      contractertokenID: map['contractertokenID'] != null
          ? map['contractertokenID'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contractorusermodel.fromJson(String source) =>
      Contractorusermodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Contractorusermodel(uname: $uname, email: $email, password: $password, cnfpassword: $cnfpassword, uid: $uid, phoneNO: $phoneNO, company: $company, adress: $adress, time: $time, contractertokenID: $contractertokenID)';
  }

  @override
  bool operator ==(covariant Contractorusermodel other) {
    if (identical(this, other)) return true;

    return other.uname == uname &&
        other.email == email &&
        other.password == password &&
        other.cnfpassword == cnfpassword &&
        other.uid == uid &&
        other.phoneNO == phoneNO &&
        other.company == company &&
        other.adress == adress &&
        other.time == time &&
        other.contractertokenID == contractertokenID;
  }

  @override
  int get hashCode {
    return uname.hashCode ^
        email.hashCode ^
        password.hashCode ^
        cnfpassword.hashCode ^
        uid.hashCode ^
        phoneNO.hashCode ^
        company.hashCode ^
        adress.hashCode ^
        time.hashCode ^
        contractertokenID.hashCode;
  }
}
