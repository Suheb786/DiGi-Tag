
import '../enums/voting.dart';

class AuditCard {
  final String message;
  final String facultyName;
  final String userImageUrl;
  final String branch;
  final Voting voting;

  const AuditCard({
    required this.facultyName,
    required this.message,
    required this.userImageUrl,
    required this.branch,
    required this.voting,
  });
}
