import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_exam/auth_widget.dart';
import 'package:map_exam/cubits/auth_cubit/auth_cubit.dart';
import 'package:map_exam/cubits/note_display_cubit/note_display_cubit.dart';
import 'package:map_exam/cubits/note_list_cubit/note_list_cubit.dart';
import 'package:map_exam/cubits/note_tool_cubit/note_tool_cubit.dart';
import 'package:map_exam/db/repositories/auth_repository.dart';
import 'package:map_exam/db/repositories/note_repository.dart';
import 'package:map_exam/firebase_options.dart';

// import 'login_screen.dart';
// import 'home_screen.dart';
// import 'edit_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<NoteRepository>(
          create: (context) => NoteRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<NoteListCubit>(
            create: (context) => NoteListCubit(
              authCubit: context.read<AuthCubit>(),
              noteRepository: context.read<NoteRepository>(),
            ),
          ),
          BlocProvider<NoteDisplayCubit>(
            create: (context) => NoteDisplayCubit(),
          ),
          BlocProvider<NoteToolCubit>(
            create: (context) => NoteToolCubit(),
          ),
        ],
        child: MaterialApp(
            title: 'myFirst',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const AuthWidget()
            // home: const LoginScreen(),
            // home: const HomeScreen(),
            // home: const EditScreen(),
            ),
      ),
    );
  }
}
