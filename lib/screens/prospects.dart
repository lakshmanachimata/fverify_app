import 'package:cak_verify/models/prospectmodel.dart';
import 'package:cak_verify/screens/prospect.dart';
import 'package:cak_verify/screens/signin.dart';
import 'package:cak_verify/viewmodel/prospectsvm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/prospectvm.dart';

class ProspectsView extends StatelessWidget {
  const ProspectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProspectsViewModel()..fetchProspects(),
      child: Scaffold(
        backgroundColor: Color(0XFFFCEAE5),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFDBD1),
          elevation: 0,
          title: Text(
            'Applicants',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
            Container(
              width: 80.0, // Set the width of the container
              height: 40.0, // Set the height of the container
              margin: EdgeInsets.only(
                right: 24.0,
                left: 0.0,
                bottom: 0.0,
              ), // Add right margin
              decoration: BoxDecoration(
                color: Color(0xFF8D5B4C),
                border: Border.all(color: Colors.black), // Add border
                borderRadius: BorderRadius.circular(
                  8.0,
                ), // Optional: Rounded corners
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInView()),
                  );

                  // Add your logout logic here
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Consumer<ProspectsViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                // Filter Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFilterChip(
                        'All',
                        viewModel.selectedFilter == 'All',
                        viewModel,
                      ),
                      SizedBox(width: 8),
                      _buildFilterChip(
                        'Pending',
                        viewModel.selectedFilter == 'Pending',
                        viewModel,
                      ),
                      SizedBox(width: 8),
                      _buildFilterChip(
                        'On Visit',
                        viewModel.selectedFilter == 'On Visit',
                        viewModel,
                      ),
                      SizedBox(width: 8),
                      _buildFilterChip(
                        'In Progress',
                        viewModel.selectedFilter == 'In Progress',
                        viewModel,
                      ),
                      SizedBox(width: 8),
                      _buildFilterChip(
                        'Completed',
                        viewModel.selectedFilter == 'Completed',
                        viewModel,
                      ),
                      SizedBox(width: 8),
                      _buildFilterChip(
                        'Postponed',
                        viewModel.selectedFilter == 'Postponed',
                        viewModel,
                      ),
                    ],
                  ),
                ),
                // Search Box
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: viewModel.updateSearchQuery,
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
                // ListView
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.filteredProspects.length,
                    itemBuilder: (context, index) {
                      return _buildProspectCard(
                        viewModel.filteredProspects[index],
                        context,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterChip(
    String label,
    bool isSelected,
    ProspectsViewModel viewModel,
  ) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: Color(0xFF8D5B4C),
      backgroundColor: Color(0xFFFFF3F0),
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
      onSelected: (selected) {
        viewModel.updateFilter(label);
      },
    );
  }

  Widget _buildProspectCard(ProspectModel prospect, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ChangeNotifierProvider(
                  create:
                      (_) =>
                          ProspectViewModel()..initializeWithProspect(prospect),
                  child: ProspectView(prospectModel: prospect),
                ),
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
                    prospect.prospectId!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(prospect.applicantName!),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(prospect.mobileNumber!),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                width: 80,
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(prospect.status!),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  prospect.status!,
                  style: TextStyle(
                    color: Color(0xFF93000A),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
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
        return Color(0xFFFFDBD1);
      case 'On Visit':
        return Color(0xFFF5E1A7);
      case 'In Progress':
        return Colors.orange;
      case 'Completed':
        return Colors.green;
      case 'Postponed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
