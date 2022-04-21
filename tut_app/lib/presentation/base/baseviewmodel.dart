abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs {

  //shared variable and functions that will be used through any view model


}

abstract class BaseViewModelInputs{
  void start();
  void dispose();
}

abstract class BaseViewModelOutputs{
  //add outputs here
}