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
              label: viewModel.prospect.applicantName!,
              buttonText: "Verify",
              onChanged: viewModel.updateApplicantName,
            ),
            SizedBox(height: 4),
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
              isMandatory: true,
              onChanged:
                  (value) => viewModel.updateAge(int.tryParse(value) ?? 0),
            ),
            SizedBox(height: 16),
            _buildTextFieldWithButton(
              label: "Residential address",
              buttonText: "Verify",
              maxLines: 4,
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
            if (viewModel.prospect.employmentType == "Employee") ...[
              SizedBox(height: 16),
              _buildTextFieldWithButton(
                label: "Office address",
                buttonText: "Verify",
                maxLines: 4,
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
              _buildTextField(
                label: "EMP ID",
                onChanged: viewModel.updateEmpId,
              ),
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
                    (value) => viewModel.updateNetSalary(
                      double.tryParse(value) ?? 0.0,
                    ),
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
            if (viewModel.prospect.employmentType == "Business") ...[
              SizedBox(height: 16),
              _buildTextFieldWithButton(
                label: "Businesss address",
                buttonText: "Verify",
                maxLines: 4,
                onChanged: viewModel.updateOfficeAddress,
              ),
              _buildTextField(
                label: "Years of Business",
                keyboardType: TextInputType.number,
                onChanged:
                    (value) => viewModel.updateYearsInCurrentOffice(
                      int.tryParse(value) ?? 0,
                    ),
              ),
              _buildTextField(
                label: "Nature of Business",
                onChanged: viewModel.updateRole,
              ),
              _buildTextField(
                label: "Previous experience",
                onChanged: viewModel.updatePreviousExperience,
              ),
              _buildTextField(
                label: "Gross Revenue",
                keyboardType: TextInputType.number,
                onChanged:
                    (value) => viewModel.updateGrossSalary(
                      double.tryParse(value) ?? 0.0,
                    ),
              ),
              SizedBox(height: 16),
              Text(
                "Business Reference",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              _buildTextField(
                label: "Name",
                onChanged: viewModel.updateColleagueName,
              ),
              _buildTextField(
                label: "Nature of Business",
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
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    bool isMandatory = false,
    required Function(String) onChanged,
  }) {
    return TextField(
      decoration:
          isMandatory
              ? InputDecoration(labelText: label, errorText: '')
              : InputDecoration(labelText: label),
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }

  Widget _buildTextFieldWithButton({
    required String label,
    required String buttonText,
    int maxLines = 1,
    required Function(String) onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(labelText: label),
            onChanged: onChanged,
            maxLines: maxLines,
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            // Logic to verify the text field value
            print("Verifying: $label");
          },
          child: Text(buttonText),
        ),
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
                      : Color(0xFFFFF3F0),
            ),
            child: Text(
              "Employee",
              style: TextStyle(
                color:
                    viewModel.prospect.employmentType == "Employee"
                        ? Colors.white
                        : Colors.black,
              ),
            ),
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
                      : Color(0xFFFFF3F0),
            ),
            child: Text(
              "Business",
              style: TextStyle(
                color:
                    viewModel.prospect.employmentType == "Business"
                        ? Colors.white
                        : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageUploadSection(ProspectViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Upload Images"),
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
