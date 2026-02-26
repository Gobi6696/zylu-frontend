import 'package:flutter/material.dart';
import '../models/employee.dart';
import '../services/employee_service.dart';

class EmployeeController extends ChangeNotifier {
  final EmployeeService _service = EmployeeService();

  Future<List<Employee>> fetchEmployees() {
    return _service.fetchEmployees();
  }

  Future<void> addEmployee(String name, String joinDate, bool isActive) {
    return _service.addEmployee(name, joinDate, isActive);
  }
}
