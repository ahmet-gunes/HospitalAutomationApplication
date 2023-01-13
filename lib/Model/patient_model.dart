class PatientDataModel {
  final int patientID;
  final String patientMail;
  final int patientPassword;
  final String patientName;
  final String patientGender;
  final String? patientPhoto;
  final int patientOnline;

  PatientDataModel(
    this.patientID,
    this.patientMail,
    this.patientPassword,
    this.patientName,
    this.patientGender,
    this.patientPhoto,
    this.patientOnline,
  );

  PatientDataModel.fromJson(Map<String, dynamic> json)
      : patientID = json['PatientID'],
        patientMail = json['PatientMail'],
        patientPassword = json['PatientPassword'],
        patientName = json['PatientName'],
        patientGender = json['PatientGender'],
        patientPhoto = json['PatientPhoto'],
        patientOnline = json['PatientOnline'];

  Map<String, dynamic> toJson() => {
        'PatientID': patientID,
        'PatientMail': patientMail,
        'PatientPassword': patientPassword,
        'PatientName': patientName,
        'PatientGender': patientGender,
        'PatientPhoto': patientPhoto,
        'PatientOnline': patientOnline
      };
}
