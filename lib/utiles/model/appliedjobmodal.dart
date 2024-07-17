// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Appliedjobmodal {
  String? workername;
  String? workergender;
  String? workerexperience;
  String? workerapplieddate;
  String? workerappliedtime;
  String? contractorname;
  String? jobtitle;
  String? description;
  String? jobprice;
  String? workerID;
  String? contacterID;
  String? status;
  String? jobID;
  String? category;
  String? postedtime;
  String? rejectID;
  Appliedjobmodal({
    this.workername,
    this.workergender,
    this.workerexperience,
    this.workerapplieddate,
    this.workerappliedtime,
    this.contractorname,
    this.jobtitle,
    this.description,
    this.jobprice,
    this.workerID,
    this.contacterID,
    this.status,
    this.jobID,
    this.category,
    this.postedtime,
    this.rejectID,
  });

  Appliedjobmodal copyWith({
    String? workername,
    String? workergender,
    String? workerexperience,
    String? workerapplieddate,
    String? workerappliedtime,
    String? contractorname,
    String? jobtitle,
    String? description,
    String? jobprice,
    String? workerID,
    String? contacterID,
    String? status,
    String? jobID,
    String? category,
    String? postedtime,
    String? rejectID,
  }) {
    return Appliedjobmodal(
      workername: workername ?? this.workername,
      workergender: workergender ?? this.workergender,
      workerexperience: workerexperience ?? this.workerexperience,
      workerapplieddate: workerapplieddate ?? this.workerapplieddate,
      workerappliedtime: workerappliedtime ?? this.workerappliedtime,
      contractorname: contractorname ?? this.contractorname,
      jobtitle: jobtitle ?? this.jobtitle,
      description: description ?? this.description,
      jobprice: jobprice ?? this.jobprice,
      workerID: workerID ?? this.workerID,
      contacterID: contacterID ?? this.contacterID,
      status: status ?? this.status,
      jobID: jobID ?? this.jobID,
      category: category ?? this.category,
      postedtime: postedtime ?? this.postedtime,
      rejectID: rejectID ?? this.rejectID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'workername': workername,
      'workergender': workergender,
      'workerexperience': workerexperience,
      'workerapplieddate': workerapplieddate,
      'workerappliedtime': workerappliedtime,
      'contractorname': contractorname,
      'jobtitle': jobtitle,
      'description': description,
      'jobprice': jobprice,
      'workerID': workerID,
      'contacterID': contacterID,
      'status': status,
      'jobID': jobID,
      'category': category,
      'postedtime': postedtime,
      'rejectID': rejectID,
    };
  }

  factory Appliedjobmodal.fromMap(Map<String, dynamic> map) {
    return Appliedjobmodal(
      workername:
          map['workername'] != null ? map['workername'] as String : null,
      workergender:
          map['workergender'] != null ? map['workergender'] as String : null,
      workerexperience: map['workerexperience'] != null
          ? map['workerexperience'] as String
          : null,
      workerapplieddate: map['workerapplieddate'] != null
          ? map['workerapplieddate'] as String
          : null,
      workerappliedtime: map['workerappliedtime'] != null
          ? map['workerappliedtime'] as String
          : null,
      contractorname: map['contractorname'] != null
          ? map['contractorname'] as String
          : null,
      jobtitle: map['jobtitle'] != null ? map['jobtitle'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      jobprice: map['jobprice'] != null ? map['jobprice'] as String : null,
      workerID: map['workerID'] != null ? map['workerID'] as String : null,
      contacterID:
          map['contacterID'] != null ? map['contacterID'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      jobID: map['jobID'] != null ? map['jobID'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      postedtime:
          map['postedtime'] != null ? map['postedtime'] as String : null,
      rejectID: map['rejectID'] != null ? map['rejectID'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Appliedjobmodal.fromJson(String source) =>
      Appliedjobmodal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Appliedjobmodal(workername: $workername, workergender: $workergender, workerexperience: $workerexperience, workerapplieddate: $workerapplieddate, workerappliedtime: $workerappliedtime, contractorname: $contractorname, jobtitle: $jobtitle, description: $description, jobprice: $jobprice, workerID: $workerID, contacterID: $contacterID, status: $status, jobID: $jobID, category: $category, postedtime: $postedtime, rejectID: $rejectID)';
  }

  @override
  bool operator ==(covariant Appliedjobmodal other) {
    if (identical(this, other)) return true;

    return other.workername == workername &&
        other.workergender == workergender &&
        other.workerexperience == workerexperience &&
        other.workerapplieddate == workerapplieddate &&
        other.workerappliedtime == workerappliedtime &&
        other.contractorname == contractorname &&
        other.jobtitle == jobtitle &&
        other.description == description &&
        other.jobprice == jobprice &&
        other.workerID == workerID &&
        other.contacterID == contacterID &&
        other.status == status &&
        other.jobID == jobID &&
        other.category == category &&
        other.postedtime == postedtime &&
        other.rejectID == rejectID;
  }

  @override
  int get hashCode {
    return workername.hashCode ^
        workergender.hashCode ^
        workerexperience.hashCode ^
        workerapplieddate.hashCode ^
        workerappliedtime.hashCode ^
        contractorname.hashCode ^
        jobtitle.hashCode ^
        description.hashCode ^
        jobprice.hashCode ^
        workerID.hashCode ^
        contacterID.hashCode ^
        status.hashCode ^
        jobID.hashCode ^
        category.hashCode ^
        postedtime.hashCode ^
        rejectID.hashCode;
  }
}

class CatagoryModel {
  String? catagoryplumnber;
  String? catagorytechnician;
  String? catagorywooder;
  String? catagoryfixer;
  CatagoryModel({
    this.catagoryplumnber,
    this.catagorytechnician,
    this.catagorywooder,
    this.catagoryfixer,
  });

  CatagoryModel copyWith({
    String? catagoryplumnber,
    String? catagorytechnician,
    String? catagorywooder,
    String? catagoryfixer,
  }) {
    return CatagoryModel(
      catagoryplumnber: catagoryplumnber ?? this.catagoryplumnber,
      catagorytechnician: catagorytechnician ?? this.catagorytechnician,
      catagorywooder: catagorywooder ?? this.catagorywooder,
      catagoryfixer: catagoryfixer ?? this.catagoryfixer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'catagoryplumnber': catagoryplumnber,
      'catagorytechnician': catagorytechnician,
      'catagorywooder': catagorywooder,
      'catagoryfixer': catagoryfixer,
    };
  }

  factory CatagoryModel.fromMap(Map<String, dynamic> map) {
    return CatagoryModel(
      catagoryplumnber: map['catagoryplumnber'] != null
          ? map['catagoryplumnber'] as String
          : null,
      catagorytechnician: map['catagorytechnician'] != null
          ? map['catagorytechnician'] as String
          : null,
      catagorywooder: map['catagorywooder'] != null
          ? map['catagorywooder'] as String
          : null,
      catagoryfixer:
          map['catagoryfixer'] != null ? map['catagoryfixer'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatagoryModel.fromJson(String source) =>
      CatagoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CatagoryModel(catagoryplumnber: $catagoryplumnber, catagorytechnician: $catagorytechnician, catagorywooder: $catagorywooder, catagoryfixer: $catagoryfixer)';
  }

  @override
  bool operator ==(covariant CatagoryModel other) {
    if (identical(this, other)) return true;

    return other.catagoryplumnber == catagoryplumnber &&
        other.catagorytechnician == catagorytechnician &&
        other.catagorywooder == catagorywooder &&
        other.catagoryfixer == catagoryfixer;
  }

  @override
  int get hashCode {
    return catagoryplumnber.hashCode ^
        catagorytechnician.hashCode ^
        catagorywooder.hashCode ^
        catagoryfixer.hashCode;
  }
}
