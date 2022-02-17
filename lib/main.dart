// flutter run --no-sound-null-safety

// geting sha1 command
// keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
// sha1 signature
// D8:F6:6B:C8:1A:28:0F:D2:17:B1:68:45:CE:42:DB:5B:2F:A0:A6:D5
//sha256 signature
// E6:C5:F4:2B:0B:6B:66:2C:85:BA:A5:94:F2:5B:3E:4F:F9:03:F4:50:50:4F:48:71:6B:0A:40:73:5C:07:1E:8A

// firabase rules
// rules_version = '2';
// service firebase.storage {
//   match /b/{bucket}/o {
//     match /{allPaths=**} {
//       allow read, write: if false;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/app_const.dart';
import 'package:flutter_app/features/presentation/cubit/chat/chat_cubit.dart';
import 'package:flutter_app/features/presentation/cubit/user/user_cubit.dart';
import 'package:flutter_app/features/presentation/pages/login_page.dart';

import 'features/presentation/cubit/auth/auth_cubit.dart';
import 'features/presentation/cubit/credential/credential_cubit.dart';
import 'features/presentation/cubit/group/group_cubit.dart';
import 'features/presentation/pages/home_page.dart';
import 'on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider<CredentialCubit>(
          create: (_) => di.sl<CredentialCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => di.sl<UserCubit>()..getUsers(),
        ),
        BlocProvider<GroupCubit>(
          create: (_) => di.sl<GroupCubit>()..getGroups(),
        ),
        BlocProvider<ChatCubit>(
          create: (_) => di.sl<ChatCubit>(),
        ),
      ],
      child: MaterialApp(
        title: AppConst.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomePage(uid: authState.uid);
                } else
                  return LoginPage();
              },
            );
          }
        },
      ),
    );
  }
}
