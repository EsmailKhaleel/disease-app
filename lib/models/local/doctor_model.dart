class DoctorInformationModel {
  final int id;
  final String image;
  final String title;
  final String hospital;
  String? info;
  String? experience;
  int? patients;
  double? rate;
  String? phoneNumber;

  DoctorInformationModel({
    required this.id,
    required this.image,
    required this.title,
    required this.hospital,
    this.info,
    this.experience,
    this.patients,
    this.rate,
    this.phoneNumber,
  });
}

List<DoctorInformationModel> doctorData = [
  DoctorInformationModel(
    id: 0,
    image: "assets/doctors/doctor7.jpg",
    title: "Dr.Magdy Yaccuob",
    hospital: "Magdi Yacoub Heart Foundation",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "56 yr",
    rate: 5.0,
    patients: 21235,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 1,
    image: "assets/doctors/doctor8.jpg",
    title: "Dr.Ayman Ammar",
    hospital: "مستشفي القلب والاوعية الدموية بالعباسية",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "25 yr",
    rate: 4.7,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 2,
    image: "assets/doctors/doctor9.jpg",
    title: "Dr.Osama Abbas",
    hospital: "مستشفي النزهة الدولي",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "15 yr",
    rate: 4.8,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 3,
    image: "assets/doctors/doctor10.jpg",
    title: "Dr.Mohamed Fouad",
    hospital: "مستشفى الفؤاد الطبى",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 4,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 5,
    image: "assets/doctors/doctor11.jpg",
    title: "Dr.Ramy Sabry",
    hospital:
        "الدقهلية - المنصورة - شارع احمد ماهر في مواجهة شارع سامية  Mansourah, Dakahlia Governorate, Egypt 35514",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 5.0,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 6,
    image: "assets/doctors/doctor6.jpg",
    title: "dr.Magdy Yaccuob",
    hospital: "Cairo Heart Hospital",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 5.0,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 7,
    image: "assets/doctors/doctor1.jpg",
    title: "dr.Magdy Yaccuob",
    hospital: "Cairo Heart Hospital",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 5.0,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 8,
    image: "assets/doctors/doctor2.jpg",
    title: "dr.Magdy Yaccuob",
    hospital: "Cairo Heart Hospital",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 5.0,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 9,
    image: "assets/doctors/doctor3.jpg",
    title: "dr.Magdy Yaccuob",
    hospital: "Cairo Heart Hospital",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 5.0,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 10,
    image: "assets/doctors/doctor4.jpg",
    title: "dr.Magdy Yaccuob",
    hospital: "Cairo Heart Hospital",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 5.0,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 11,
    image: "assets/doctors/doctor5.jpg",
    title: "dr.Magdy Yaccuob",
    hospital: "Cairo Heart Hospital",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 5.0,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 12,
    image: "assets/doctors/doctor6.jpg",
    title: "dr.Magdy Yaccuob",
    hospital: "Cairo Heart Hospital",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 5.0,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 13,
    image: "assets/doctors/doctor1.jpg",
    title: "dr.Magdy Yaccuob",
    hospital: "Cairo Heart Hospital",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 5.0,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 14,
    image: "assets/doctors/doctor2.jpg",
    title: "dr.Magdy Yaccuob",
    hospital: "Cairo Heart Hospital",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 5.0,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
  DoctorInformationModel(
    id: 15,
    image: "assets/doctors/doctor3.jpg",
    title: "dr.Magdy Yaccuob",
    hospital: "Cairo Heart Hospital",
    info:
        "Sir Magdi Habib Yacoub OM FRS (Arabic: د/مجدى حبيب يعقوب) (born 16 November 1935), is a Coptic Egyptian-British retired professor of cardiothoracic surgery at Imperial College London, best known for his early work in repairing heart valves with surgeon Donald Ross, adapting the Ross procedure, where the diseased aortic valve is replaced with the person's own pulmonary valve, devising the arterial switch operation (ASO) in transposition of",
    experience: "3 yr",
    rate: 5.0,
    patients: 21000,
    phoneNumber: "+0201028571526",
  ),
];
