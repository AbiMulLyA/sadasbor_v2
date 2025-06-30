//* ServerException
class ServerException implements Exception {}

//* BackendException
class BackendException implements Exception {
  final String message;

  BackendException(this.message);
}

//* SessionException
class SessionInvalidException implements Exception {}

//* CacheException
class CacheException implements Exception {}
