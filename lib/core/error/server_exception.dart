class ServerException {
  final String message;

  ServerException(this.message);

  @override
  String toString() {
    return 'Server Exception: $message';
  }
}
