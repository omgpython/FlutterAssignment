class Task {
  int? id;
  String name;
  String description;
  String date;
  String time;
  String priority;
  bool isCompleted;

  Task({
    this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.priority,
    this.isCompleted = false,
  });

  // Convert Task to Map for inserting into database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'time': time,
      'priority': priority,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  // Convert Map to Task
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      date: map['date'],
      time: map['time'],
      priority: map['priority'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}
