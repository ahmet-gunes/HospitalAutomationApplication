class patientDataModel {
  final int PatientID;
  final String PatientMail;
  final int PatientPassword;
  final String PatientName;
  final String PatientGender;
  final Null PatientPhoto;
  final int PatientOnline;

  patientDataModel(
    this.PatientID,
    this.PatientMail,
    this.PatientPassword,
    this.PatientName,
    this.PatientGender,
    this.PatientPhoto,
    this.PatientOnline,
  );

  patientDataModel.fromJson(Map<String, dynamic> json)
      : PatientID = json['PatientID'],
        PatientMail = json['PatientMail'],
        PatientPassword = json['PatientPassword'],
        PatientName = json['PatientName'],
        PatientGender = json['PatientGender'],
        PatientPhoto = json['PatientPhoto'],
        PatientOnline = json['PatientOnline'];

  Map<String, dynamic> toJson() => {
        'PatientID': PatientID,
        'PatientMail': PatientMail,
        'PatientPassword': PatientPassword,
        'PatientName': PatientName,
        'PatientGender': PatientGender,
        'PatientPhoto': PatientPhoto,
        'PatientOnline': PatientOnline
      };
}
