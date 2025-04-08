import 'package:cak_verify/models/prospectmodel.dart';
import 'package:cak_verify/screens/prospect.dart';
import 'package:cak_verify/utils.dart';
import 'package:cak_verify/viewmodel/prospectvm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProspectsView extends StatelessWidget {
  const ProspectsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProspectModel> prospects = generateRandomProspects();
    return ChangeNotifierProvider(
      create: (_) => ProspectViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFCEFEA),
          elevation: 0,
          title: Text('Prospects', style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              icon: Icon(Icons.filter_list, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Color(0xFFFCEFEA),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFilterChip('All', true),
                  _buildFilterChip('Pending', false),
                  _buildFilterChip('On Visit', false),
                  _buildFilterChip('In Progress', false),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search prospects...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color(0xFFFFF3F0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    prospects.length, // Replace with ViewModel data length
                itemBuilder: (context, index) {
                  return _buildProspectCard(
                    prospects[index], // Replace with ViewModel logic
                    context,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: Color(0xFF8D5B4C),
      backgroundColor: Color(0xFFFFF3F0),
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
      onSelected: (selected) {
        // Handle filter selection using ViewModel
      },
    );
  }

  Widget _buildProspectCard(ProspectModel prosect, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProspectView(prospectModel: prosect),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prosect.prospectId!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(prosect.applicantName!),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(prosect.mobileNumber!),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(prosect.status!),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  prosect.status!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'On Visit':
        return Colors.yellow;
      case 'In Progress':
        return Colors.blue;
      case 'Completed':
        return Colors.green;
      case 'Postponed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
