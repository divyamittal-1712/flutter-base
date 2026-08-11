
import 'package:base_flutter/data/network/api/web_impl.dart';
import 'package:base_flutter/data/network/http/http_service.dart';
import 'package:base_flutter/ui/screen/viewModel/audio_play_view_model.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setupServices() {
  serviceLocator.registerFactory(() => Http());
  serviceLocator.registerLazySingleton<WebApiImpl>(() => WebApiImpl());

  serviceLocator.registerFactory<AudioPlayViewModel>(() => AudioPlayViewModel());
}
