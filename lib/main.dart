import 'package:xmail/email/bloc/email_bloc.dart';
import 'package:xmail/email/provider/provider.dart';
import 'package:xmail/email/repository/repository.dart';
import 'package:xmail/email/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp({Key? key}) : super(key: key);

  // home repository
  final EmailRepository emailRepository = EmailRepository(
    emailProvider: EmailProvider(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => EmailBloc(
            emailRepository: emailRepository,
          ),
        ),
      ],
      child: RepositoryProvider.value(
        value: EmailRepository,
        child: MaterialApp(
          title: 'xMail',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            // textTheme: GoogleFonts.montserratTextTheme(),
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
