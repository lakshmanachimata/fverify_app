import 'package:flutter/material.dart';

import '../models/prospectmodel.dart';

class ProspectViewModel extends ChangeNotifier {
  void initializeWithProspect(ProspectModel prospect) {
    _prospect.applicantName = prospect.applicantName;
    _prospect.mobileNumber = prospect.mobileNumber;
    _prospect.gender = prospect.gender;
    _prospect.age = prospect.age;
    _prospect.residentialAddress = prospect.residentialAddress;
    _prospect.yearsOfStay = prospect.yearsOfStay;
    _prospect.numberOfFamilyMembers = prospect.numberOfFamilyMembers;
    _prospect.referenceName = prospect.referenceName;
    _prospect.referenceRelation = prospect.referenceRelation;
    _prospect.referenceMobile = prospect.referenceMobile;
    _prospect.employmentType = prospect.employmentType;
    _prospect.officeAddress = prospect.officeAddress;
    _prospect.yearsInCurrentOffice = prospect.yearsInCurrentOffice;
    _prospect.role = prospect.role;
    _prospect.empId = prospect.empId;
    _prospect.previousExperience = prospect.previousExperience;
    _prospect.grossSalary = prospect.grossSalary;
    _prospect.netSalary = prospect.netSalary;
    _prospect.colleagueName = prospect.colleagueName;
    _prospect.colleagueDesignation = prospect.colleagueDesignation;
    _prospect.colleagueMobile = prospect.colleagueMobile;
    _prospect.uploadedImages = List.from(prospect.uploadedImages);
    _prospect.remarks = prospect.remarks;
    notifyListeners();
  }

  final ProspectModel _prospect = ProspectModel();

  ProspectModel get prospect => _prospect;

  void updateApplicantName(String name) {
    _prospect.applicantName = name;
    notifyListeners();
  }

  void updateGender(String? gender) {
    _prospect.gender = gender;
    notifyListeners();
  }

  void updateAge(int age) {
    _prospect.age = age;
    notifyListeners();
  }

  void updateResidentialAddress(String address) {
    _prospect.residentialAddress = address;
    notifyListeners();
  }

  void updateYearsOfStay(int years) {
    _prospect.yearsOfStay = years;
    notifyListeners();
  }

  void updateNumberOfFamilyMembers(int count) {
    _prospect.numberOfFamilyMembers = count;
    notifyListeners();
  }

  void updateReferenceName(String name) {
    _prospect.referenceName = name;
    notifyListeners();
  }

  void updateReferenceRelation(String relation) {
    _prospect.referenceRelation = relation;
    notifyListeners();
  }

  void updateReferenceMobile(String mobile) {
    _prospect.referenceMobile = mobile;
    notifyListeners();
  }

  void updateEmploymentType(String type) {
    _prospect.employmentType = type;
    notifyListeners();
  }

  void updateOfficeAddress(String address) {
    _prospect.officeAddress = address;
    notifyListeners();
  }

  void updateYearsInCurrentOffice(int years) {
    _prospect.yearsInCurrentOffice = years;
    notifyListeners();
  }

  void updateRole(String role) {
    _prospect.role = role;
    notifyListeners();
  }

  void updateEmpId(String empId) {
    _prospect.empId = empId;
    notifyListeners();
  }

  void updatePreviousExperience(String experience) {
    _prospect.previousExperience = experience;
    notifyListeners();
  }

  void updateGrossSalary(double salary) {
    _prospect.grossSalary = salary;
    notifyListeners();
  }

  void updateNetSalary(double salary) {
    _prospect.netSalary = salary;
    notifyListeners();
  }

  void updateColleagueName(String name) {
    _prospect.colleagueName = name;
    notifyListeners();
  }

  void updateColleagueDesignation(String designation) {
    _prospect.colleagueDesignation = designation;
    notifyListeners();
  }

  void updateColleagueMobile(String mobile) {
    _prospect.colleagueMobile = mobile;
    notifyListeners();
  }

  void addImage(String imagePath) {
    if (_prospect.uploadedImages.length < 5) {
      _prospect.uploadedImages.add(imagePath);
      notifyListeners();
    }
  }

  void removeImage(String imagePath) {
    _prospect.uploadedImages.remove(imagePath);
    notifyListeners();
  }

  void updateRemarks(String remarks) {
    _prospect.remarks = remarks;
    notifyListeners();
  }

  void saveForm() {
    // Logic to save the form data
    print("Form saved: ${_prospect.toString()}");
  }

  String? getMobileNUmber() {
    // Logic to get the mobile number
    return prospect.mobileNumber;
  }

  void completeForm() {
    // Logic to complete the form submission
    print("Form completed: ${_prospect.toString()}");
  }
}
