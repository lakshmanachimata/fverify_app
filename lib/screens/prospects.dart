import 'package:cak_verify/models/prospectmodel.dart';
import 'package:cak_verify/screens/prospect.dart';
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
        appBar: AppBar(
          backgroundColor: Color(0xFFFCEFEA),
          elevation: 0,
          title: Text('Prospects', style: TextStyle(color: Colors.black)),
        ),
        body: Consumer<ProspectsViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                // Filter Chips
                Container(
                  color: Color(0xFFFCEFEA),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFilterChip(
                        'All',
                        viewModel.selectedFilter == 'All',
                        viewModel,
                      ),
                      _buildFilterChip(
                        'Pending',
                        viewModel.selectedFilter == 'Pending',
                        viewModel,
                      ),
                      _buildFilterChip(
                        'On Visit',
                        viewModel.selectedFilter == 'On Visit',
                        viewModel,
                      ),
                      _buildFilterChip(
                        'In Progress',
                        viewModel.selectedFilter == 'In Progress',
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
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(prospect.status!),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  prospect.status!,
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
