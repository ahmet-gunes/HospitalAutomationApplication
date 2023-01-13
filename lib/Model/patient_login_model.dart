class PatientLoginModel {
  String? patientMail;
  int? patientPassword;

  PatientLoginModel({
    this.patientMail,
    this.patientPassword,
  });
  PatientLoginModel.fromJson(Map<String, dynamic> json) {
    patientMail = json['patientMail']?.toString();
    patientPassword = json['patientPassword']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['patientMail'] = patientMail;
    data['patientPassword'] = patientPassword;
    return data;
  }
}
