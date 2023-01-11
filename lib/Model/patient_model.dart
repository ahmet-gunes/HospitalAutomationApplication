class patientDataModel {
  int? PatientID;
  String? PatientMail;
  int? PatientPassword;
  String? PatientName;
  String? PatientGender;
  String? PatientPhoto;
  int? PatientOnline;

  patientDataModel({
    this.PatientID,
    this.PatientMail,
    this.PatientPassword,
    this.PatientName,
    this.PatientGender,
    this.PatientPhoto,
    this.PatientOnline,
  });
  patientDataModel.fromJson(Map<String, dynamic> json) {
    PatientID = json['PatientID']?.toInt();
    PatientMail = json['PatientMail']?.toString();
    PatientPassword = json['PatientPassword']?.toInt();
    PatientName = json['PatientName']?.toString();
    PatientGender = json['PatientGender']?.toString();
    PatientPhoto = json['PatientPhoto']?.toString();
    PatientOnline = json['PatientOnline']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['PatientID'] = PatientID;
    data['PatientMail'] = PatientMail;
    data['PatientPassword'] = PatientPassword;
    data['PatientName'] = PatientName;
    data['PatientGender'] = PatientGender;
    data['PatientPhoto'] = PatientPhoto;
    data['PatientOnline'] = PatientOnline;
    return data;
  }
}
