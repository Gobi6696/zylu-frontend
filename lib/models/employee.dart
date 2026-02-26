class Employee {
  final int id;
  final String name;
  final String joinDate; // Format: YYYY-MM-DD
  final bool isActive;

  Employee({
    required this.id,
    required this.name,
    required this.joinDate,
    required this.isActive,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      joinDate: json['join_date'],
      isActive: json['is_active'] == 1 || json['is_active'] == true,
    );
  }

  int get yearsInOrganization {
    final joinDateTime = DateTime.parse(joinDate);
    final now = DateTime.now();
    final difference = now.difference(joinDateTime);
    return (difference.inDays / 365).floor();
  }

  bool get shouldHighlight => yearsInOrganization > 5 && isActive;
}
