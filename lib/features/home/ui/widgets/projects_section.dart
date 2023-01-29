import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portfolio/core/global_widgets/custom_button.dart';
import 'package:flutter_portfolio/core/utils/assets_path_generator.dart';
import 'package:flutter_portfolio/features/home/bloc/bloc/home_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/size_checker.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Constants.mobileTitleSize,
      color: Constants.creamColor,
    );
    bool isMobile = SizeChecker.isMobile(context);
    bool isTablet = size.width > 600 && size.width < 900;

    var outerBoxSize = 730.0;
    const spacer = 50.0;
    return SizedBox(
      height: outerBoxSize,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: outerBoxSize - 40,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: [
                  const SizedBox(height: spacer),
                  Text(
                    "Projects",
                    style: style,
                  ),
                  const SizedBox(height: spacer),
                  BlocBuilder(
                    bloc: context.read<HomeBloc>(),
                    builder: (context, state) {
                      if (state is FetchHomeDataSuccess) {
                        return CarouselSlider(
                          options: CarouselOptions(
                            height: 450.0,
                            disableCenter: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            autoPlay: true,
                            viewportFraction: isMobile
                                ? .9
                                : isTablet
                                    ? .7
                                    : .5,
                          ),
                          items: state.homeData.projects!.map((i) {
                            return ProjectItem(
                              imagePath: state.homeData.projects![1].banner,
                              title: state.homeData.projects![1].title ??
                                  "Unkowne",
                              description:
                                  state.homeData.projects![1].description ??
                                      "Unkowne",
                            );
                          }).toList(),
                        );
                      }
                      if (state is FetchHomeDataFailure) {
                        SizedBox(
                          height: 450,
                          width: size.width,
                          child: Center(
                            child: CustomButton(
                              title: "Try again",
                              onPressed: () {
                                context.read<HomeBloc>().add(HomeDataFetched());
                              },
                            ),
                          ),
                        );
                      }

                      return SizedBox(
                        height: 450,
                        width: size.width,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 50,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                assetsPathGenerator("images/abs_logo.png"),
                width: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    super.key,
    this.imagePath,
    required this.title,
    required this.description,
  });

  final String title, description;
  final String? imagePath;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Constants.creamColor,
      fontSize: Constants.mobileTitleSize,
    );
    bool isMobile = SizeChecker.isMobile(context);

    return MouseRegion(
      onEnter: (event) {
        isHover = true;
        setState(() {});
      },
      onExit: (event) {
        isHover = false;
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: isMobile ? size.width * .9 : 450,
          height: 450,
          decoration: BoxDecoration(
            color: Constants.creamColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Material(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: ExtendedImage.network(
                  widget.imagePath ?? "",
                  height: 330,
                  width: size.width * .9,
                  fit: BoxFit.cover,
                  cache: true,
                  border: Border.all(color: Colors.red, width: 1.0),
                  //cancelToken: cancellationToken,
                ),
              ),
              const Expanded(
                  child: SizedBox(
                height: 1,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: style.copyWith(
                                color: isHover
                                    ? Constants.orangeColor
                                    : Constants.creamColor),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            width: isHover ? 150 : 0,
                            height: 3,
                            color: isHover
                                ? Constants.orangeColor
                                : Colors.transparent,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.description,
                            style: style.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: isHover
                          ? Constants.orangeColor
                          : Constants.creamColor,
                      size: 60,
                    )
                  ],
                ),
              ),
              const Expanded(
                  child: SizedBox(
                height: 1,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
