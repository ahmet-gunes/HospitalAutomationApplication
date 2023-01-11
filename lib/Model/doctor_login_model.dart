class doctorLoginModel {
  String? doctorMail;
  int? doctorPassword;

  doctorLoginModel({
    this.doctorMail,
    this.doctorPassword,
  });
  doctorLoginModel.fromJson(Map<String, dynamic> json) {
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
