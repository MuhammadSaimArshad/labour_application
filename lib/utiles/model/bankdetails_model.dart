// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Bankdetailmodel {
  String? accountntholdername;
  String? bankname;
  String? accountnumber;
  String? sortcode;

  Bankdetailmodel({
    this.accountntholdername,
    this.bankname,
    this.accountnumber,
    this.sortcode,
  });

  Bankdetailmodel copyWith({
    String? accountntholdername,
    String? bankname,
    String? accountnumber,
    String? sortcode,
  }) {
    return Bankdetailmodel(
      accountntholdername: accountntholdername ?? this.accountntholdername,
      bankname: bankname ?? this.bankname,
      accountnumber: accountnumber ?? this.accountnumber,
      sortcode: sortcode ?? this.sortcode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountntholdername': accountntholdername,
      'bankname': bankname,
      'accountnumber': accountnumber,
      'sortcode': sortcode,
    };
  }

  factory Bankdetailmodel.fromMap(Map<String, dynamic> map) {
    return Bankdetailmodel(
      accountntholdername: map['accountntholdername'] != null
          ? map['accountntholdername'] as String
          : null,
      bankname: map['bankname'] != null ? map['bankname'] as String : null,
      accountnumber:
          map['accountnumber'] != null ? map['accountnumber'] as String : null,
      sortcode: map['sortcode'] != null ? map['sortcode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bankdetailmodel.fromJson(String source) =>
      Bankdetailmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Bankdetailmodel(accountntholdername: $accountntholdername, bankname: $bankname, accountnumber: $accountnumber, sortcode: $sortcode)';
  }

  @override
  bool operator ==(covariant Bankdetailmodel other) {
    if (identical(this, other)) return true;

    return other.accountntholdername == accountntholdername &&
        other.bankname == bankname &&
        other.accountnumber == accountnumber &&
        other.sortcode == sortcode;
  }

  @override
  int get hashCode {
    return accountntholdername.hashCode ^
        bankname.hashCode ^
        accountnumber.hashCode ^
        sortcode.hashCode;
  }
}
