import '../modules/widgets/enums.dart';

class AuditCard {
  final String message;
  final String facultyName;
  final String userImageUrl;
  final String branch;
  final Voting voting;

  AuditCard({
    required this.facultyName,
    required this.message,
    required this.userImageUrl,
    required this.branch,
    required this.voting,
  });
}
