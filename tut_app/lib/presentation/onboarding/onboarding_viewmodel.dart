import 'package:tut_app/presentation/base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{
  //stream controllers


  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevoius() {
    // TODO: implement goPrevoius
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

}

//input means the orders that our view model will recieve from the view

abstract class OnBoardingViewModelInputs{
  void goNext(); // when user clicks on right arrow or swipe left
  void goPrevoius(); // when user clicks on left arrow or swipe right

  void onPageChanged(int index); 

 
}


//output means the data or results that will be sent to the view model to our view
abstract class OnBoardingViewModelOutputs{



 
}