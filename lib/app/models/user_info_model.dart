class UserInfo {
  bool isVarified = false;
  bool isAdmin = false;
  int version = 1;
  String fullName = "";
  String email = "";
  DateTime dob = DateTime.now();
  String city = "";
  String address = "";
  String course = "";
  String branch = "";
  String semester = "";
  String rollNo = "";
  String enrollmentNo = "";
  String bloodGroup = "";
  String alergy = "";
  String studentType = "";
  String vacination = "";
  String phoneNo = "";

  UserInfo({
    this.isVarified = false,
    this.isAdmin = false,
    this.version = 1,
    required this.fullName,
    required this.email,
    required this.dob,
    required this.city,
    required this.address,
    required this.course,
    required this.branch,
    required this.semester,
    required this.rollNo,
    required this.enrollmentNo,
    required this.bloodGroup,
    this.alergy = 'N/A',
    required this.studentType,
    required this.vacination,
    required this.phoneNo,
  });

  UserInfo.toObject(Map<String, dynamic> map) {
    isVarified = map['isVarified'];
    isAdmin = map["isAdmin"];
  }
}
