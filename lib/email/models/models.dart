class EmailModel {
  final String fromName;
  final String fromEmail;
  final String toEmail;
  final String subject;
  final String message;

  EmailModel({
    required this.fromName,
    required this.fromEmail,
    required this.toEmail,
    required this.subject,
    required this.message,
  });
}
