class DoctorLoginModel {
  String? doctorMail;
  int? doctorPassword;

  DoctorLoginModel({
    this.doctorMail,
    this.doctorPassword,
  });
  DoctorLoginModel.fromJson(Map<String, dynamic> json) {
    doctorMail = json['doctorMail']?.toString();
    doctorPassword = json['doctorPassword']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['doctorMail'] = doctorMail;
    data['doctorPassword'] = doctorPassword;
    return data;
  }
}
