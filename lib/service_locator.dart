import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sferius_ai/core/blocs/chat_text_size_cubit.dart';
import 'package:sferius_ai/core/config/dio_config.dart';
import 'package:sferius_ai/core/config/local_config.dart';
import 'package:sferius_ai/core/localization/cubit/localization_cubit.dart';
import 'package:sferius_ai/features/profile/data/datasources/local_auth_datasources.dart';
import 'package:sferius_ai/features/profile/data/datasources/user_datasource.dart';
import 'package:sferius_ai/features/profile/data/repositories/user_repository_impl.dart';
import 'package:sferius_ai/features/profile/domain/usecases/get_user_usecase.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/bloc/login_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:sferius_ai/features/sfereius/data/datasources/chat_datasource.dart';
import 'package:sferius_ai/features/sfereius/data/repositories/chat_repository_impl.dart';
import 'package:sferius_ai/features/sfereius/presentation/blocs/chat_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  // config and local
  sl.registerFactory(() => DioConfig());
  sl.registerFactory(() => LocalConfig(sharedPreferences: sharedPreferences));
  sl.registerFactory(
    () => LocalAuthDatasources(localConfig: sl<LocalConfig>()),
  );

  //localization cubit
  sl.registerFactory(() => LocaleCubit(localConfig: sl<LocalConfig>()));

  //text size cubit
  sl.registerFactory(() => ChatTextSizeCubit(sl<LocalConfig>()));

  //blocs, repos and datasources in profile
  sl.registerFactory(() => AuthenticateBloc());
  sl.registerFactory(() => LoginBloc(sl<LocalAuthDatasources>()));
  sl.registerFactory(
    () => UserDatasource(
      dio: sl<DioConfig>().client,
      localAuthDatasources: sl<LocalAuthDatasources>(),
      localConfig: sl<LocalConfig>(),
    ),
  );
  sl.registerFactory(
    () => UserRepositoryImpl(
      userDatasource: sl<UserDatasource>(),
      internetConnectionChecker: InternetConnectionChecker.createInstance(),
      localConfig: sl<LocalConfig>(),
    ),
  );

  sl.registerFactory(
    () => GetUserUsecase(userRepositoryImpl: sl<UserRepositoryImpl>()),
  );

  sl.registerFactory(
    () => UserBloc(
      getUserUsecase: sl<GetUserUsecase>(),
      localConfig: sl<LocalConfig>(),
    ),
  );

  //sferius blocs, repos and datasources
  sl.registerFactory(() => ChatRemoteDataSource(dio: sl<DioConfig>().client));
  sl.registerFactory(
    () => ChatRepositoryImpl(sl<ChatRemoteDataSource>(), sl<LocalConfig>()),
  );
  sl.registerFactory(() => ChatBloc(sl<ChatRepositoryImpl>()));
}
