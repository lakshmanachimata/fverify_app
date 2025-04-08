import 'package:cak_verify/models/prospectmodel.dart';
import 'package:cak_verify/viewmodel/prospectvm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProspectView extends StatelessWidget {
  final ProspectModel prospectModel;

  const ProspectView({super.key, required this.prospectModel});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProspectViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Prospect Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextFieldWithButton(
              label: "Confirm applicant name",
              buttonText: "Verify",
              onChanged: viewModel.updateApplicantName,
            ),
            Text(
              "Mobile number: ${viewModel.prospect.mobileNumber!}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildGenderSelection(viewModel),
            SizedBox(height: 16),
            _buildTextField(
              label: "Age",
              keyboardType: TextInputType.number,
              onChanged:
                  (value) => viewModel.updateAge(int.tryParse(value) ?? 0),
            ),
            SizedBox(height: 16),
            _buildTextFieldWithButton(
              label: "Residential address",
              buttonText: "Verify",
              onChanged: viewModel.updateResidentialAddress,
            ),
            SizedBox(height: 16),
            _buildTextField(
              label: "Years of stay",
              keyboardType: TextInputType.number,
              onChanged:
                  (value) =>
                      viewModel.updateYearsOfStay(int.tryParse(value) ?? 0),
            ),
            SizedBox(height: 16),
            _buildTextField(
              label: "Number of family members",
              keyboardType: TextInputType.number,
              onChanged:
                  (value) => viewModel.updateNumberOfFamilyMembers(
                    int.tryParse(value) ?? 0,
                  ),
            ),
            SizedBox(height: 16),
            Text(
              "Reference Details",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildTextField(
              label: "Reference name",
              onChanged: viewModel.updateReferenceName,
            ),
            _buildTextField(
              label: "Relation",
              onChanged: viewModel.updateReferenceRelation,
            ),
            _buildTextField(
              label: "Mobile number",
              keyboardType: TextInputType.phone,
              onChanged: viewModel.updateReferenceMobile,
            ),
            SizedBox(height: 16),
            _buildEmploymentTypeSelection(viewModel),
            SizedBox(height: 16),
            _buildTextField(
              label: "Office address",
              onChanged: viewModel.updateOfficeAddress,
            ),
            _buildTextField(
              label: "Years of working in current office",
              keyboardType: TextInputType.number,
              onChanged:
                  (value) => viewModel.updateYearsInCurrentOffice(
                    int.tryParse(value) ?? 0,
                  ),
            ),
            _buildTextField(
              label: "Role of applicant",
              onChanged: viewModel.updateRole,
            ),
            _buildTextField(label: "EMP ID", onChanged: viewModel.updateEmpId),
            _buildTextField(
              label: "Previous experience",
              onChanged: viewModel.updatePreviousExperience,
            ),
            _buildTextField(
              label: "Gross salary",
              keyboardType: TextInputType.number,
              onChanged:
                  (value) => viewModel.updateGrossSalary(
                    double.tryParse(value) ?? 0.0,
                  ),
            ),
            _buildTextField(
              label: "Net salary",
              keyboardType: TextInputType.number,
              onChanged:
                  (value) =>
                      viewModel.updateNetSalary(double.tryParse(value) ?? 0.0),
            ),
            SizedBox(height: 16),
            Text(
              "Colleague Reference",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildTextField(
              label: "Name",
              onChanged: viewModel.updateColleagueName,
            ),
            _buildTextField(
              label: "Designation",
              onChanged: viewModel.updateColleagueDesignation,
            ),
            _buildTextField(
              label: "Mobile number",
              keyboardType: TextInputType.phone,
              onChanged: viewModel.updateColleagueMobile,
            ),
            SizedBox(height: 16),
            _buildImageUploadSection(viewModel),
            SizedBox(height: 16),
            _buildTextField(
              label: "Enter remarks/observations",
              maxLines: 3,
              onChanged: viewModel.updateRemarks,
            ),
            SizedBox(height: 16),
            _buildActionButtons(viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    required Function(String) onChanged,
  }) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }

  Widget _buildTextFieldWithButton({
    required String label,
    required String buttonText,
    required Function(String) onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(labelText: label),
            onChanged: onChanged,
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(onPressed: () {}, child: Text(buttonText)),
      ],
    );
  }

  Widget _buildGenderSelection(ProspectViewModel viewModel) {
    return Row(
      children: [
        Text("Gender:"),
        ...["Male", "Female", "Other"].map((gender) {
          return Row(
            children: [
              Radio<String>(
                value: gender,
                groupValue: viewModel.prospect.gender,
                onChanged: viewModel.updateGender,
              ),
              Text(gender),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildEmploymentTypeSelection(ProspectViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => viewModel.updateEmploymentType("Employee"),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  viewModel.prospect.employmentType == "Employee"
                      ? Colors.brown
                      : Colors.grey[300],
            ),
            child: Text("Employee"),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () => viewModel.updateEmploymentType("Business"),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  viewModel.prospect.employmentType == "Business"
                      ? Colors.brown
                      : Colors.grey[300],
            ),
            child: Text("Business"),
          ),
        ),
      ],
    );
  }

  Widget _buildImageUploadSection(ProspectViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Upload Images (${viewModel.prospect.uploadedImages.length}/5)"),
        Wrap(
          spacing: 8,
          children: List.generate(5, (index) {
            if (index < viewModel.prospect.uploadedImages.length) {
              return Stack(
                children: [
                  Image.network(
                    viewModel.prospect.uploadedImages[index],
                    width: 100,
                    height: 100,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed:
                          () => viewModel.removeImage(
                            viewModel.prospect.uploadedImages[index],
                          ),
                    ),
                  ),
                ],
              );
            } else {
              return GestureDetector(
                onTap: () {
                  // Logic to pick and add an image
                  viewModel.addImage("path/to/image.jpg");
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: Icon(Icons.add),
                ),
              );
            }
          }),
        ),
      ],
    );
  }

  Widget _buildActionButtons(ProspectViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: viewModel.completeForm,
          child: Text("Complete"),
        ),
        ElevatedButton(onPressed: viewModel.saveForm, child: Text("Save")),
      ],
    );
  }
}
