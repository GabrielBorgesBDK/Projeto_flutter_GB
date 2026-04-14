
// Classe que representa uma tarefa no sistema
class Task {

 // Título ou nome da tarefa
  String title;


 // Indica se a tarefa foi concluída
  bool isDone;


 // Data associada à tarefa
  String date;

// Construtor da classe Task
  Task({
    required this.title,
    required this.date,
    this.isDone = false,
  });
}