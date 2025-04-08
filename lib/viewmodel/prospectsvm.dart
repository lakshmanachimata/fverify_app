import 'package:cak_verify/models/prospectmodel.dart';
import 'package:cak_verify/services/prospectsvc.dart';
import 'package:flutter/material.dart';

class ProspectsViewModel extends ChangeNotifier {
  final ProspectService _service = ProspectService();
  List<ProspectModel> _prospects = [];
  List<ProspectModel> _filteredProspects = [];
  String _selectedFilter = 'All';
  String _searchQuery = '';

  List<ProspectModel> get filteredProspects => _filteredProspects;
  String get selectedFilter => _selectedFilter;

  Future<void> fetchProspects() async {
    _prospects = await _service.fetchProspects();
    _applyFilters();
  }

  void updateFilter(String filter) {
    _selectedFilter = filter;
    _applyFilters();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void _applyFilters() {
    _filteredProspects =
        _prospects.where((prospect) {
          final matchesFilter =
              _selectedFilter == 'All' || prospect.status == _selectedFilter;
          final matchesSearch =
              _searchQuery.isEmpty ||
              (prospect.applicantName?.toLowerCase().contains(
                    _searchQuery.toLowerCase(),
                  ) ??
                  false);
          return matchesFilter && matchesSearch;
        }).toList();
    notifyListeners();
  }
}
