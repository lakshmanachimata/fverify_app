// lib/services/prospect_service.dart
import 'dart:math';

import '../models/prospectmodel.dart';

class ProspectService {
  List<ProspectModel> fetchProspects() {
    final random = Random();
    final genders = ['Male', 'Female', 'Other'];
    final employmentTypes = ['Employee', 'Business'];

    return List.generate(10, (index) {
      ProspectModel prospectModel = ProspectModel(
        prospectId: 'Prospect ${index + 1}',
        applicantName: 'Applicant ${index + 1}',
        mobileNumber: '+1 234 567 89${random.nextInt(100)}',
        gender: genders[random.nextInt(genders.length)],
        age: 20 + random.nextInt(30),
        residentialAddress: 'Address ${index + 1}, City ${random.nextInt(100)}',
        yearsOfStay: random.nextInt(20),
        numberOfFamilyMembers: 1 + random.nextInt(5),
        referenceName: 'Reference ${index + 1}',
        referenceRelation: 'Relation ${index + 1}',
        referenceMobile: '+1 987 654 32${random.nextInt(100)}',
        employmentType: employmentTypes[random.nextInt(employmentTypes.length)],
        officeAddress: 'Office Address ${index + 1}',
        yearsInCurrentOffice: random.nextInt(10),
        role: 'Role ${index + 1}',
        empId: 'EMP${random.nextInt(1000)}',
        previousExperience: '${random.nextInt(10)} years',
        grossSalary: 50000 + random.nextDouble() * 50000,
        netSalary: 40000 + random.nextDouble() * 40000,
        colleagueName: 'Colleague ${index + 1}',
        colleagueDesignation: 'Designation ${index + 1}',
        colleagueMobile: '+1 456 789 12${random.nextInt(100)}',
        status: _getStatus(index),
        uploadedImages: List.generate(
          random.nextInt(5),
          (i) => 'https://example.com/image${index + 1}_${i + 1}.jpg',
        ),
        remarks: 'Remarks for applicant ${index + 1}',
      );
      return prospectModel;
    });
  }

  String _getStatus(int index) {
    // Replace with ViewModel logic
    const statuses = [
      'Pending',
      'On Visit',
      'In Progress',
      'Completed',
      'Postponed',
    ];
    return statuses[index % statuses.length];
  }
}
