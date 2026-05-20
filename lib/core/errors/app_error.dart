enum ErrorType {
  network,
  server,
  notFound,
  unauthorized,
  unknown,
}

class AppError {
  final ErrorType type;
  final String message;
  final String? details;

  const AppError({
    required this.type,
    required this.message,
    this.details,
  });

  factory AppError.from(dynamic error, {String? customMessage}) {
    final errorStr = error.toString().toLowerCase();

    if (errorStr.contains('socketexception') ||
        errorStr.contains('connection refused') ||
        errorStr.contains('timeout') ||
        errorStr.contains('no internet') ||
        errorStr.contains('网络')) {
      return AppError(
        type: ErrorType.network,
        message: customMessage ?? '网络连接失败',
        details: '请检查您的网络连接后重试',
      );
    }

    if (errorStr.contains('404') || errorStr.contains('not found')) {
      return AppError(
        type: ErrorType.notFound,
        message: customMessage ?? '内容不存在',
        details: '请求的资源可能已被删除或移动',
      );
    }

    if (errorStr.contains('401') ||
        errorStr.contains('unauthorized') ||
        errorStr.contains('未授权') ||
        errorStr.contains('权限')) {
      return AppError(
        type: ErrorType.unauthorized,
        message: customMessage ?? '未授权访问',
        details: '请重新登录或检查权限设置',
      );
    }

    if (errorStr.contains('500') ||
        errorStr.contains('server error') ||
        errorStr.contains('服务器错误')) {
      return AppError(
        type: ErrorType.server,
        message: customMessage ?? '服务器错误',
        details: '服务器出了点问题，请稍后再试',
      );
    }

    return AppError(
      type: ErrorType.unknown,
      message: customMessage ?? '出了点问题',
      details: errorStr,
    );
  }

  String get title {
    switch (type) {
      case ErrorType.network:
        return '网络问题';
      case ErrorType.server:
        return '服务器错误';
      case ErrorType.notFound:
        return '未找到';
      case ErrorType.unauthorized:
        return '权限不足';
      case ErrorType.unknown:
        return '未知错误';
    }
  }
}
