# App de Tarefas Flutter

Aplicativo mobile desenvolvido em Flutter com autenticação básica e
gerenciamento de tarefas por data.

------------------------------------------------------------------------

## Funcionalidades

-   Tela de login
-   Tela de cadastro
-   Seleção de data via calendário
-   Criação de tarefas
-   Marcar tarefas como concluídas
-   Remoção de tarefas
-   Listagem filtrada por data
-   Ordenação automática:
    -   Tarefas pendentes primeiro
    -   Ordenação alfabética

------------------------------------------------------------------------

## Estrutura do Projeto

lib/ │ ├── models/ │ └── task.dart │ ├── screens/ │ ├──
login_screen.dart │ ├── register_screen.dart │ └── home_screen.dart │
└── main.dart

------------------------------------------------------------------------

## Tecnologias Utilizadas

-   Flutter
-   Dart
-   Material Design

------------------------------------------------------------------------

## Lógica do Sistema

### Modelo de Tarefa

Cada tarefa contém: - Título - Data - Status (concluída ou não)

### Filtro por Data

As tarefas exibidas são filtradas com base na data selecionada no
calendário.

### Ordenação

-   Tarefas não concluídas aparecem primeiro
-   Ordenação alfabética entre tarefas do mesmo estado

------------------------------------------------------------------------

## Execução do Projeto

git clone https://github.com/seuusuario/app-tarefas-flutter.git cd
app-tarefas-flutter flutter pub get flutter run

------------------------------------------------------------------------

## Observações

-   Não possui persistência de dados
-   Autenticação simulada
-   Dados são perdidos ao reiniciar o aplicativo

------------------------------------------------------------------------

## Próximas Melhorias

-   Persistência com banco de dados (SQLite ou Hive)
-   Implementação de autenticação real
-   Validação de formulários
-   Gerenciamento de estado (Provider, Riverpod ou similar)
-   Separação em camadas (arquitetura limpa)

------------------------------------------------------------------------

## Autor

Gabriel
