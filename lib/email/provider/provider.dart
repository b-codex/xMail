import 'dart:convert';

import 'package:xmail/email/models/models.dart';
import 'package:http/http.dart' as http;

class EmailProvider {
  Future sendEmail({
    required EmailModel emailModel,
  }) async {
    Map parameters = {
      'service_id': 'service_0ffz15l',
      'template_id': 'template_74p4uye',
      'user_id': 'sFp3LFjt67DP8Smhh',
      'accessToken': 'EL7LhVA6K_VTIKeQ-sfvo',
      'template_params': {
        'fromName': emailModel.fromName,
        'fromEmail': emailModel.fromEmail,
        'toEmail': emailModel.toEmail,
        'subject': emailModel.subject,
        'message': emailModel.message,
      },
    };

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(parameters),
    );

    if (response.statusCode == 200) {
      return 200;
    } else {
      return 404;
    }
  }
}
