import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employee.dart';

class EmployeeService {
  static const String baseUrl = 'http://192.168.68.122/employee-api/public';

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
      Employee(id: 1, name: 'Gobinath', joinDate: '2015-05-10', isActive: true),
      Employee(id: 2, name: 'Lisa', joinDate: '2019-09-11', isActive: true),
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
      Employee(id: 7, name: 'Arun', joinDate: '2018-07-05', isActive: true),
      Employee(id: 8, name: 'Vinoth', joinDate: '2024-04-27', isActive: false),
      Employee(id: 9, name: 'Prasanth', joinDate: '2016-02-22', isActive: true),
      Employee(id: 10, name: 'Karthi', joinDate: '2017-08-11', isActive: false),
      Employee(id: 11, name: 'Ajith', joinDate: '2021-01-14', isActive: true),
    ];
  }
}
