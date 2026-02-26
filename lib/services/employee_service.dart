import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employee.dart';

class EmployeeService {
  // Adjust this URL based on where your backend is hosted
  // Updated to point to your XAMPP Laravel installation
  static const String baseUrl = 'http://192.168.68.134/employee-api/public';

  Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/employees'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Employee.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      // Return mock data if backend isn't running, for demonstration
      return _getMockEmployees();
    }
  }

  Future<void> addEmployee(String name, String joinDate, bool isActive) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/employees'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'join_date': joinDate,
        'is_active': isActive,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add employee: ${response.body}');
    }
  }

  List<Employee> _getMockEmployees() {
    return [
      Employee(id: 1, name: 'John Doe', joinDate: '2015-05-10', isActive: true),
      Employee(
        id: 2,
        name: 'Jane Smith',
        joinDate: '2019-03-20',
        isActive: true,
      ),
      Employee(
        id: 3,
        name: 'Robert Brown',
        joinDate: '2010-11-15',
        isActive: true,
      ),
      Employee(
        id: 4,
        name: 'Emma Wilson',
        joinDate: '2021-08-01',
        isActive: false,
      ),
      Employee(
        id: 5,
        name: 'Michael Davis',
        joinDate: '2017-12-10',
        isActive: true,
      ),
      Employee(
        id: 6,
        name: 'Sarah Miller',
        joinDate: '2014-06-25',
        isActive: false,
      ),
    ];
  }
}
