import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portfolio/core/global_widgets/custom_cache_image.dart';
import 'package:flutter_portfolio/features/home/bloc/bloc/home_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/size_checker.dart';
import '../../data/model/home_model.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        color: Constants.creamColor,
        child: _builder(context));
  }

  _builder(BuildContext context) {
    return SkillSectionBuilder();
  }
}

class SkillSectionBuilder extends StatelessWidget {
  const SkillSectionBuilder({super.key});

  lineSplitter(BuildContext context) {
    bool isMobile = SizeChecker.isMobile(context);
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * (isMobile ? .6 : .30),
      height: 3,
      color: Constants.greenColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List<Skills> skills = [];
        if (state is FetchHomeDataSuccess) {
          skills = state.homeData.skills ?? [];
        }

        var style = const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Constants.mobileTitleSize,
          color: Colors.black,
        );
        var size = MediaQuery.of(context).size;
        bool isMobile = SizeChecker.isMobile(context);

        return Center(
          child: Wrap(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            alignment: WrapAlignment.center,
            children: List.generate(skills.length,
                (index) => _eachSkillItem(context, skills[index])).toList(),
          ),
        );
      },
    );
  }

  Widget _eachSkillItem(BuildContext context, Skills skill) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Constants.mobileTitleSize,
      color: Colors.black,
    );
    var size = MediaQuery.of(context).size;
    bool isMobile = SizeChecker.isMobile(context);
    return Padding(
      padding: const EdgeInsets.all(Constants.mobileVerticalPadding),
      child: SizedBox(
        width: size.width * (isMobile ? .6 : .35),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  skill.title!,
                  style: style,
                ),
                const SizedBox(
                  height: 4,
                ),
                lineSplitter(context),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                skill.skillItems!.length,
                (index) => SkillItem(
                  title: skill.skillItems![index].title!,
                  isLong: skill.skillItems![index].long!,
                  imagePath: skill.skillItems![index].image,
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  const SkillItem({
    super.key,
    required this.title,
    this.imagePath,
    this.isLong = false,
  });

  final String title;
  final String? imagePath;
  final bool isLong;
  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Constants.mobileCaptionSize,
      color: (imagePath != null) ? Constants.creamColor : Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.all(Constants.mobilePadding),
      child: Container(
        padding: const EdgeInsets.all(Constants.mobilePadding),
        width: isLong ? 200 : 120,
        decoration: BoxDecoration(
          color: (imagePath != null) ? Colors.black : Colors.transparent,
          border: Border.all(
            color: (imagePath != null) ? Colors.black : Constants.greenColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Wrap(children: [
                CustomCacheImage(
                  path: imagePath!,
                ),
                const SizedBox(
                  width: 10,
                ),
              ]),
            Text(
              title,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
