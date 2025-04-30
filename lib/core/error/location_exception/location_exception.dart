class LocationException implements Exception {
  final String message;
  final LocationErrorType type;

  LocationException(this.message, this.type);
}

class LocationPermissionDeniedException implements Exception {
  final String message;
  LocationPermissionDeniedException(this.message);
}

enum LocationErrorType {
  serviceDisabled,
  permissionDenied,
  permissionDeniedForever,
  unknown,
}
