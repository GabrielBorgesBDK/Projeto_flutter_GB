import 'package:flutter/material.dart';
import '../models/task.dart';

// Tela principal do app (stateful porque muda estado: lista, data, etc.)
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Estado da tela
class _HomeScreenState extends State<HomeScreen> {

  // Lista de tarefas
  List<Task> tasks = [];

  // Data selecionada no calendário
  DateTime selectedDate = DateTime.now();

  // Retorna a data formatada (dd/mm/aaaa)
  String getDate() {
    return "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
  }

  // Adiciona nova tarefa
  void addTask(String title) {
    setState(() {
      tasks.add(Task(
        title: title,
        date: getDate(), // salva a data atual
      ));
      sortTasks(); // organiza após adicionar
    });
  }

  // Ordena tarefas:
  // - não concluídas primeiro
  // - depois por ordem alfabética
  void sortTasks() {
    tasks.sort((a, b) {
      if (a.isDone == b.isDone) {
        return a.title.compareTo(b.title);
      }
      return a.isDone ? 1 : -1;
    });
  }

  // Marca/desmarca tarefa como concluída
  void toggleTask(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
      sortTasks(); // reorganiza após mudança
    });
  }

  // Remove tarefa da lista
  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // Abre popup para criar nova tarefa
  void showAddDialog() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Nova tarefa"),

        // Campo de digitação
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Digite a tarefa"),
        ),

        // Botão de adicionar
        actions: [
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                addTask(controller.text);
              }
              Navigator.pop(context); // fecha popup
            },
            child: Text("Adicionar"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // Filtra tarefas apenas da data selecionada
    List<Task> filteredTasks = tasks
        .where((task) => task.date == getDate())
        .toList();

    return Scaffold(

      // TOPO
      appBar: AppBar(
        title: Text("Tarefas - ${getDate()}"),
        backgroundColor: Colors.blue.shade900,
      ),

      body: Column(
        children: [

          // 🔵 CALENDÁRIO
          Theme(
            data: ThemeData(
              colorScheme: ColorScheme.light(
                primary: Colors.blue.shade900,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
            ),
            child: CalendarDatePicker(
              initialDate: selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),

              // Quando muda a data
              onDateChanged: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),

          Divider(),

          // 📋 LISTA DE TAREFAS
          Expanded(
            child: ListView.builder(
              itemCount: filteredTasks.length,

              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue[50],
                  margin: EdgeInsets.all(8),

                  child: ListTile(

                    // Título da tarefa
                    title: Text(
                      filteredTasks[index].title,
                      style: TextStyle(
                        decoration: filteredTasks[index].isDone
                            ? TextDecoration.lineThrough // riscado se concluído
                            : null,
                      ),
                    ),

                    // Checkbox (concluir tarefa)
                    leading: Checkbox(
                      value: filteredTasks[index].isDone,
                      activeColor: Colors.blue.shade900,

                      onChanged: (_) => toggleTask(
                        tasks.indexOf(filteredTasks[index]),
                      ),
                    ),

                    // Botão de deletar
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => removeTask(
                        tasks.indexOf(filteredTasks[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // 🔵 BOTÃO FLUTUANTE (+)
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.blue.shade900,
          elevation: 10,
          onPressed: showAddDialog,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}