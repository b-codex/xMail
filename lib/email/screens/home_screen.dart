import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:xmail/email/bloc/email_bloc.dart';
import 'package:xmail/email/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final bloc = BlocProvider.of<EmailBloc>(context);

    var fromNameController = TextEditingController();
    var fromEmailController = TextEditingController();
    var toEmailController = TextEditingController();
    var subjectController = TextEditingController();
    var messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Email By XD'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   mainAxisSize: MainAxisSize.max,
              //   children: [
              //     Container(
              //       margin: const EdgeInsets.symmetric(vertical: 34),
              //       child: const Text(
              //         'Email By XD',
              //         style: TextStyle(fontSize: 34),
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                margin: const EdgeInsets.all(7),
                child: TextFormField(
                  controller: fromNameController,
                  decoration: InputDecoration(
                    labelText: 'From Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field can\'t be empty.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    // print(value);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(7),
                child: TextFormField(
                  controller: fromEmailController,
                  decoration: InputDecoration(
                    labelText: 'From Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field can\'t be empty.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    // print(value);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(7),
                child: TextFormField(
                  controller: toEmailController,
                  decoration: InputDecoration(
                    labelText: 'To Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field can\'t be empty.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    // print(value);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(7),
                child: TextFormField(
                  controller: subjectController,
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field can\'t be empty.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    // print(value);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(7),
                child: TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                    labelText: 'Message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field can\'t be empty.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    // print(value);
                  },
                ),
              ),
              BlocConsumer<EmailBloc, EmailState>(
                listener: (context, state) {
                  if (state is Success) {}
                  animatedSnackBar(
                    context: context,
                    message: 'Sent successfully',
                    animatedSnackBarType: AnimatedSnackBarType.success,
                  );
                  if (state is Failure) {
                    animatedSnackBar(
                      context: context,
                      message: 'Failed to send',
                      animatedSnackBarType: AnimatedSnackBarType.error,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is Sending) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 7,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(400, 50),
                        ),
                        onPressed: null,
                        child: const Text('Send Email'),
                      ),
                    );
                  }
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 7,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(400, 50),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          bloc.add(
                            SendEmailEvent(
                              emailModel: EmailModel(
                                fromName: fromNameController.text,
                                fromEmail: fromEmailController.text,
                                toEmail: toEmailController.text,
                                subject: subjectController.text,
                                message: messageController.text,
                              ),
                            ),
                          );
                        }
                        if (!_formKey.currentState!.validate()) {
                          animatedSnackBar(
                            context: context,
                            message: 'Failed to validate form',
                            animatedSnackBarType: AnimatedSnackBarType.error,
                          );
                        }
                      },
                      child: const Text('Send Email'),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

animatedSnackBar({
  required context,
  required String message,
  required AnimatedSnackBarType animatedSnackBarType,
}) {
  return AnimatedSnackBar.material(
    message,
    type: animatedSnackBarType,
    mobileSnackBarPosition: MobileSnackBarPosition.top,
    duration: const Duration(seconds: 5),
  ).show(context);
}
