import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portfolio/features/home/ui/project_detail/project_detail_screen.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/global_widgets/custom_button.dart';
import '../../../../../core/global_widgets/custom_mouse_region.dart';
import '../../../../../core/utils/size_checker.dart';
import '../../../bloc/bloc/home_bloc.dart';
import '../../../data/model/home_model.dart';

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

    return Container(
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(height: spacer),
          Text(
            "Projects",
            style: style,
          ),
          const SizedBox(height: spacer),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
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

              if (state is FetchHomeDataSuccess) {
                return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount:
                      getCrossAxisCount(MediaQuery.of(context).size.width),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: List.generate(
                      state.homeData.projects!.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: ProjectItem(
                              project: state.homeData.projects![index],
                            ),
                          )).toList(),
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
          const SizedBox(height: spacer),
        ],
      ),
    );
  }

  int getCrossAxisCount(double width) {
    if (width < 600) {
      return 1;
    } else if (width < 900) {
      return 2;
    } else if (width < 1200) {
      return 3;
    } else {
      return 4;
    }
  }
}

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    super.key,
    required this.project,
  });

  final Projects project;

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

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailScreen(item: widget.project),
            ));
      },
      child: CustomMouseRegion(
        cursor: SystemMouseCursors.click,
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
            decoration: BoxDecoration(
              color: Constants.creamColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Material(
                  color: Constants.creamColor.withOpacity(.2),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: ExtendedImage.network(
                    widget.project.banner ?? "",
                    width: size.width * .9,
                    fit: BoxFit.cover,
                    cache: true,
                    enableLoadState: false,
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
                              widget.project.title ?? "Unknown",
                              style: style.copyWith(
                                  fontSize: 20,
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
                              widget.project.description ?? "Unknown",
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
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: isHover
                            ? Constants.orangeColor
                            : Constants.creamColor,
                        size: 30,
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
      ),
    );
  }
}
