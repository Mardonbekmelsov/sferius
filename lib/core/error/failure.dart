abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class ApiFailure extends Failure {}

class NetworkFailure extends Failure {}

class AuthorizationFailure extends Failure{}
