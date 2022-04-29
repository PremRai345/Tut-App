import 'dart:async';

import 'package:tut_app/domain/model.dart';
import 'package:tut_app/presentation/base/baseviewmodel.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';

import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //stream controllers

  final StreamController streamController = StreamController<SlideViewObject>();

  late final List<SliderObject> list;
  int currentIndex = 0;

//input
  @override
  void dispose() {
    // TODO: implement dispose

    streamController.close();
  }

  @override
  void start() {
    // TODO: implement start

    list = getSliderData();
    //send this slide to our view

    postDataToView();
  }

  @override
  int goNext() {
    // TODO: implement goNext

    int nextIndex = currentIndex++; //-1
    if (nextIndex >= list.length) {
      currentIndex =
          0; // infinite loop to go to the first item inside the slider

    }
    
    return currentIndex;
  }

  @override
  int goPrevoius() {
    int previousIndex = currentIndex--; //-1
    if (previousIndex == -1) {
      currentIndex =
          list.length - 1; // infinite loop to go to the length of slider list

    }

    return currentIndex;
  }

  @override
  void onPageChanged(int index) {
    currentIndex = index;
    postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => streamController.sink;

//output
  @override
  // TODO: implement outputSliderViewObject
  Stream<SlideViewObject> get outputSliderViewObject =>
      streamController.stream.map((slideViewObject) => slideViewObject);

//private functions
  List<SliderObject> getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
      ];

  postDataToView() {
    inputSliderViewObject.add(
      SlideViewObject(list[currentIndex], list.length, currentIndex),
    );
  }
}

//input means the orders that our view model will recieve from the view

abstract class OnBoardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe left
  void goPrevoius(); // when user clicks on left arrow or swipe right

  void onPageChanged(int index);

  Sink
      get inputSliderViewObject; //This is the wasy to add data to the stream.. stream input
}

//output means the data or results that will be sent to the view model to our view
abstract class OnBoardingViewModelOutputs {
  Stream<SlideViewObject>
      get outputSliderViewObject; //This is the wasy to add data to the stream.. stream output
}

class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SlideViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
