abstract class ApiResponse<T> {
  ApiResponseEnum? responseEnum;
  T? data;
  String? errorMessage;

  ApiResponse(this.responseEnum, this.data, this.errorMessage);
}

class Success<T> extends ApiResponse<T> {
  Success(T data):super(ApiResponseEnum.apiSuccess, data, "");
}

class ServerError<T> extends ApiResponse<T> {
  ServerError(String errorMessage) : super(ApiResponseEnum.apiServerError, null, errorMessage);
}

class NoInternetConnection<T> extends ApiResponse<T>{
   NoInternetConnection(String errorMessage) : super(ApiResponseEnum.noInternetConnection, null, errorMessage);
}


enum ApiResponseEnum {
  apiSuccess,
  apiServerError,
  noInternetConnection,
}