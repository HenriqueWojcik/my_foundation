class Failure {
  final String title;
  final String message;

  Failure({required this.title, required this.message});

  @override
  String toString() {
    return '$title >> $message';
  }
}
