part of 'email_bloc.dart';

@immutable
abstract class EmailEvent {}

class SendEmailEvent extends EmailEvent {
  final EmailModel emailModel;

  SendEmailEvent({required this.emailModel});
}
