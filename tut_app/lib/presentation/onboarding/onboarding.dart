import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/resources/value_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> list = getSliderData();
  PageController pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  List<SliderObject> getSliderData() => [
        SliderObject(AppStrings.onBoardingSubTitle1,
            AppStrings.onBoardingTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingSubTitle2,
            AppStrings.onBoardingTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingSubTitle3,
            AppStrings.onBoardingTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingSubTitle4,
            AppStrings.onBoardingTitle4, ImageAssets.onboardingLogo4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: list.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(list[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        width: double.infinity,
        height: 120,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.end,
                ),
              ),
            ),

            //button sheet widget is called
            getBottomSheetWidget()
          ],
        ),
      ),
    );
  }

  Widget getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s40,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                // next slide
                pageController.animateToPage(getNextIndex(),
                    duration:
                        const Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          ),

          //circle indicator
          Row(
            children: [
              for (int i = 0; i < list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: getProperCircle(i),
                ),
            ],
          ),

          //right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s40,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightarrowIc),
              ),
              onTap: () {
                pageController.animateToPage(getPrevoiusIndex(),
                    duration:
                        const Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
        ],
      ),
    );
  }

  int getPrevoiusIndex() {
    int previousIndex = currentIndex--; //-1
    if (previousIndex == -1) {
      currentIndex =
          list.length - 1; // infinite loop to go to the length of slider list

    }
    return currentIndex;
  }

  int getNextIndex() {
    int nextIndex = currentIndex++; //-1
    if (nextIndex >= list.length) {
      currentIndex =
          0; // infinite loop to go to the first item inside the slider

    }
    return currentIndex;
  }

  Widget getProperCircle(int index) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc); //select slider
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc); // unselet slider
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject sliderObject;
  OnBoardingPage(this.sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(sliderObject.image)
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
