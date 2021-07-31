class Todo {
  final int id;
  final int taskId;
  final String title;
  final int estFait;
  Todo({this.id, this.taskId, this.title, this.estFait});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskId': taskId,
      'title': title,
      'estFait': estFait,
    };
  }
}