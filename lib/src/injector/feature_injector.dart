abstract class FeatureInjector {
  void inject() {
    injectExceptionHandler();
    injectRepositories();
    injectUsecases();
    injectControllers();
  }

  void injectDatasourcesImpl();
  void injectDatasourcesMock();
  void injectExceptionHandler();
  void injectRepositories();
  void injectUsecases();
  void injectControllers();
}
