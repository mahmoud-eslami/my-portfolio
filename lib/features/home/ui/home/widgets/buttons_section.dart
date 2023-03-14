import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';
import 'package:flutter_portfolio/core/global_widgets/animation_builder.dart';
import 'package:flutter_portfolio/core/utils/url_launcher.dart';

import '../../../../../core/global_widgets/custom_button.dart';
import '../../../../../core/utils/size_checker.dart';
import '../../../bloc/bloc/home_bloc.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _builder(context);
  }

  _builder(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isMobile = SizeChecker.isMobile(context);
    if (isMobile) {
      return AnimationBuilder(
        child: Column(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                String link = "https://google.com";
                if (state is FetchHomeDataSuccess) {
                  link = state.homeData.resume!;
                }
                if (state is FetchHomeDataLoading) return Container();

                return CustomButton(
                  title: (state is FetchHomeDataFailure)
                      ? "Error: tap to try again!"
                      : "Download CV",
                  onPressed: () {
                    if (state is FetchHomeDataSuccess) {
                      launchTheUrl(link);
                    } else if (state is FetchHomeDataFailure) {
                      context.read<HomeBloc>().add(HomeDataFetched());
                    }
                  },
                  width: size.width * .4,
                  height: Constants.mobileBtnHeight,
                );
              },
            ),
            CustomButton(
              title: "Hire me!",
              onPressed: () {
                launchTheUrl(Constants.emailUrl);
              },
              width: size.width * .4,
              height: Constants.mobileBtnHeight,
            ),
          ],
        ),
      );
    } else {
      return AnimationBuilder(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              title: "Download CV",
              onPressed: () {
                launchTheUrl(Constants.resumeUrl);
              },
              width: Constants.desktopButtonWidth,
              height: Constants.desktopButtonHeight,
            ),
            const SizedBox(
              width: 20,
            ),
            CustomButton(
              title: "Hire me !",
              onPressed: () {
                launchTheUrl(Constants.emailUrl);
              },
              width: Constants.desktopButtonWidth,
              height: Constants.desktopButtonHeight,
            ),
          ],
        ),
      );
    }
  }
}
