class ProspectModel {
  String? prospectId;
  String? applicantName;
  String? mobileNumber;
  String? gender;
  int? age;
  String? residentialAddress;
  int? yearsOfStay;
  int? numberOfFamilyMembers;
  String? referenceName;
  String? referenceRelation;
  String? referenceMobile;
  String? employmentType; // "Employee" or "Business"
  String? officeAddress;
  int? yearsInCurrentOffice;
  String? role;
  String? empId;
  String? status;
  String? previousExperience;
  double? grossSalary;
  double? netSalary;
  String? colleagueName;
  String? colleagueDesignation;
  String? colleagueMobile;
  List<String> uploadedImages = [];
  String? remarks;

  ProspectModel({
    this.prospectId,
    this.applicantName,
    this.mobileNumber,
    this.gender,
    this.age,
    this.residentialAddress,
    this.yearsOfStay,
    this.numberOfFamilyMembers,
    this.referenceName,
    this.referenceRelation,
    this.referenceMobile,
    this.employmentType,
    this.officeAddress,
    this.yearsInCurrentOffice,
    this.role,
    this.status,
    this.empId,
    this.previousExperience,
    this.grossSalary,
    this.netSalary,
    this.colleagueName,
    this.colleagueDesignation,
    this.colleagueMobile,
    this.uploadedImages = const [],
    this.remarks,
  });
}
