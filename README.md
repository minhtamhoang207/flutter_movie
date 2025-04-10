# Flutter Movie App

## Project Overview
A Flutter application for exploring movies and TV shows using TMDB API, built with clean architecture principles.

## Folder Structure
```
lib/
├── core/
│   ├── di/          # Dependency injection
│   └── network/     # Network configuration
├── features/
│   └── example/
│       ├── data/
│       │   ├── models/
│       │   └── repositories/
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
└── main.dart
```

## Setup Instructions

### Prerequisites

1. Install Flutter Version Management (FVM)
```bash
# Install FVM
dart pub global activate fvm

# Verify installation
fvm --version
```

2. Install Flutter SDK using FVM
```bash
# Install and configure Flutter version
fvm install
fvm use

# Check Flutter installation
fvm flutter doctor
```

3. Clone the repository
```bash
git clone <repository-url>
cd flutter_movie
```

### Project Setup
1. Install dependencies
```bash
fvm flutter pub get
```

2. Generate code (freezed models, retrofit clients)
```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

### Development
```bash
# Run the app in debug mode
fvm flutter run

# Format code
fvm flutter format .

# Analyze code
fvm flutter analyze
```

### Git Workflow
```bash
# Create feature branch
git checkout -b feature/movie-list

# Stage and commit changes
git add .
git commit -m "feat: implement movie list"

# Push changes
git push origin feature/movie-list
```

#### Branch Naming
- feature/* : New features
- bugfix/* : Bug fixes
- hotfix/* : Critical fixes

#### Commit Message Format
- feat: New feature
- fix: Bug fix
- docs: Documentation
- style: Formatting
- refactor: Code restructure

## Core Features
1. Browse Movies & Shows
   - Trending movies carousel
   - Popular movies/shows list
   - Filter by genres

2. Search
   - Search for movies and TV shows
   - View search results

3. Details View
   - Movie/show information
   - Cast information
   - Similar recommendations

4. Favorites
   - Save to favorites
   - View favorites list

## Tech Stack
- **State Management**: flutter_bloc
- **API**: dio, retrofit
- **Models**: freezed, json_serializable
- **Dependency Injection**: get_it
- **Code Generation**: build_runner

## TMDB API Endpoints
Base URL: https://api.themoviedb.org/3

1. Movies
   - Get Trending: `/trending/movie/day`
   - Get Popular: `/movie/popular`
   - Get Details: `/movie/{movie_id}`
   - Get Credits: `/movie/{movie_id}/credits`

2. TV Shows
   - Get Popular: `/tv/popular`
   - Get Details: `/tv/{tv_id}`

3. Search
   - Search Movies: `/search/movie?query={query}`
   - Search TV: `/search/tv?query={query}`

4. Genres
   - Get Movie Genres: `/genre/movie/list`



## Todo Feature Architecture

The Todo feature follows a clean architecture pattern with unidirectional data flow. Here's how the different layers interact:

### 1. Presentation Layer

#### UI Components (`todo_page.dart`)
- **TodoPage**: Main UI component that displays the todo list
- Implements filtering by user ID
- Uses BlocBuilder to react to state changes

#### State Management (`todo_bloc.dart`)
- **TodoBloc**: Manages UI state and business logic
- **Events**:
    - `loadTodos`: Fetches all todos
    - `filterByUserId`: Filters todos by user ID
- **States**:
    - `initial`: Initial state
    - `loading`: Loading data
    - `loaded`: Data loaded successfully
    - `error`: Error occurred

### 2. Domain Layer

#### Repository (`todo_repository.dart`)
- **TodoRepository**: Abstracts data operations
- Methods:
    - `getTodos()`: Fetches all todos
    - `getTodoById(id)`: Fetches specific todo
    - `getTodosByUserId(userId)`: Fetches user's todos

### 3. Data Layer

#### API (`todo_api.dart`)
- **TodoApi**: Handles API communication
- Uses Dio for HTTP requests
- Endpoints:
    - GET `/todos`: Fetch all todos
    - GET `/todos/{id}`: Fetch specific todo
    - GET `/todos?userId={userId}`: Fetch user's todos

#### Models (`todo_model.dart`)
- **TodoModel**: Data model for todos
- Properties:
    - userId: User identifier
    - id: Todo identifier
    - title: Todo description
    - completed: Todo status

### Data Flow

1. User Action → UI
    - User interacts with TodoPage
    - TodoPage dispatches events to TodoBloc

2. State Management
    - TodoBloc receives events
    - Calls appropriate repository methods
    - Emits new states based on results

3. Data Operations
    - Repository processes requests
    - Calls API methods
    - Handles data transformation

4. API Communication
    - API makes HTTP requests
    - Deserializes responses into TodoModel
    - Returns data to Repository

### Dependency Injection

The app uses GetIt for dependency injection:
```dart
// Registering dependencies
getIt.registerLazySingleton(() => TodoApi(getIt()));
getIt.registerLazySingleton(() => TodoRepository(getIt()));
getIt.registerFactory(() => TodoBloc(getIt()));
```

### Error Handling

Errors are handled at multiple levels:
1. API level: HTTP errors
2. Repository level: Data processing errors
3. Bloc level: Business logic errors
4. UI level: Error state display

This architecture ensures:
- Clear separation of concerns
- Testable components
- Maintainable codebase
- Scalable feature development

### Working and Calling Flow

#### Loading Todos Flow

1. **UI Interaction**
```dart
// In todo_page.dart
class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        // Initial load
        context.read<TodoBloc>().add(LoadTodos());
        // ... UI rendering logic
      }
    );
  }
}
```

2. **Bloc Processing**
```dart
// In todo_bloc.dart
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  on<LoadTodos>((event, emit) async {
    emit(TodoState.loading());
    try {
      final todos = await _repository.getTodos();
      emit(TodoState.loaded(todos));
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  });
}
```

3. **Repository Layer**
```dart
// In todo_repository.dart
class TodoRepository {
  Future<List<Todo>> getTodos() async {
    final response = await _api.getTodos();
    return response.map((json) => Todo.fromJson(json)).toList();
  }
}
```

4. **API Layer**
```dart
// In todo_api.dart
class TodoApi {
  Future<List<Map<String, dynamic>>> getTodos() async {
    final response = await _dio.get('/todos');
    return List<Map<String, dynamic>>.from(response.data);
  }
}
```

#### Filtering by User ID Flow

1. **UI Trigger**
```dart
// In todo_page.dart
ElevatedButton(
  onPressed: () {
    context.read<TodoBloc>().add(FilterByUserId(userId: selectedUserId));
  },
  child: Text('Filter'),
)
```

2. **Bloc Handler**
```dart
// In todo_bloc.dart
on<FilterByUserId>((event, emit) async {
  emit(TodoState.loading());
  try {
    final todos = await _repository.getTodosByUserId(event.userId);
    emit(TodoState.loaded(todos));
  } catch (e) {
    emit(TodoState.error(e.toString()));
  }
});
```

3. **Repository Processing**
```dart
// In todo_repository.dart
Future<List<Todo>> getTodosByUserId(int userId) async {
  final response = await _api.getTodosByUserId(userId);
  return response.map((json) => Todo.fromJson(json)).toList();
}
```

4. **API Request**
```dart
// In todo_api.dart
Future<List<Map<String, dynamic>>> getTodosByUserId(int userId) async {
  final response = await _dio.get('/todos', queryParameters: {'userId': userId});
  return List<Map<String, dynamic>>.from(response.data);
}
```

#### Key Flow Characteristics

1. **Unidirectional Data Flow**
    - User actions trigger Bloc events
    - Bloc emits new states
    - UI rebuilds based on state changes

2. **Error Handling Chain**
    - API layer catches HTTP errors
    - Repository transforms API errors
    - Bloc converts to user-friendly messages
    - UI displays error states

3. **State Management**
    - Clear state transitions (loading → loaded/error)
    - Predictable UI updates
    - Consistent error handling

4. **Dependency Flow**
    - UI → Bloc → Repository → API
    - Each layer has single responsibility
    - Clean separation of concerns