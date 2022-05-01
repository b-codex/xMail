import 'package:xmail/email/models/models.dart';
import 'package:xmail/email/provider/provider.dart';

class EmailRepository {
  final EmailProvider emailProvider;

  EmailRepository({required this.emailProvider});

  Future sendEmail(EmailModel emailModel) async {
    final response = await emailProvider.sendEmail(emailModel: emailModel);

    return response;
  }
}
