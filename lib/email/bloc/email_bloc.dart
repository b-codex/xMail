import 'package:bloc/bloc.dart';
import 'package:xmail/email/models/models.dart';
import 'package:xmail/email/repository/repository.dart';
import 'package:meta/meta.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepository emailRepository;

  EmailBloc({required this.emailRepository}) : super(EmailInitial()) {
    on<SendEmailEvent>((event, emit) async {
      emit(Sending());

      final response = await emailRepository.sendEmail(event.emailModel);

      await Future.delayed(
        const Duration(
          seconds: 2,
        ),
      );

      if (response == 200) {
        emit(Success());
      } else {
        emit(Failure());
      }
    });
  }
}
