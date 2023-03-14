import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portfolio/features/home/data/model/home_model.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/global_widgets/custom_cache_image.dart';
import '../../../../core/utils/size_checker.dart';
import '../home/widgets/skills_sections.dart';

class ProjectDetailScreen extends HookWidget {
  const ProjectDetailScreen({super.key, required this.item});

  final Projects item;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    var size = MediaQuery.of(context).size;
    var style = Theme.of(context).textTheme;
    bool isMobile = SizeChecker.isMobile(context);
    bool isTablet = size.width > 600 && size.width < 900;
    return Scaffold(
        backgroundColor: Constants.creamColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            item.title ?? "Unknown",
            style: style.headlineSmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * .01,
              ),
              if (item.images == null || item.images!.isEmpty) ...[
                Container(
                  width: 280,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Constants.defaultBorderRadius),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Material(
                    borderRadius:
                        BorderRadius.circular(Constants.defaultBorderRadius),
                    clipBehavior: Clip.hardEdge,
                    child: CustomCacheImage(
                      path: item.banner!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
              ],
              if (item.images != null && item.images!.isNotEmpty)
                SizedBox(
                  height: size.height * .8,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: size.height * .03,
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            width: 280,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Constants.defaultBorderRadius),
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: CustomCacheImage(
                              path: item.images![currentIndex.value],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Expanded(
                          flex: 2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                item.images!.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    currentIndex.value = index;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Constants.defaultPadding),
                                    child: Stack(
                                      children: [
                                        Material(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                Constants.defaultBorderRadius),
                                            side: BorderSide(
                                              color: Constants.orangeColor,
                                              width:
                                                  (currentIndex.value == index)
                                                      ? 4
                                                      : 0,
                                            ),
                                          ),
                                          child: SizedBox(
                                            width: (currentIndex.value == index)
                                                ? 100
                                                : 30,
                                            height: 100,
                                            child: CustomCacheImage(
                                              fit: BoxFit.cover,
                                              path: item.images![index],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: (currentIndex.value == index)
                                              ? 100
                                              : 30,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: currentIndex.value == index
                                                ? Colors.transparent
                                                : Colors.black.withOpacity(.6),
                                            borderRadius: BorderRadius.circular(
                                                Constants.defaultBorderRadius),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              DetailsSection(item: item),
            ],
          ),
        ));
  }
}

class DetailsSection extends HookWidget {
  const DetailsSection({Key? key, required this.item}) : super(key: key);

  final Projects item;

  @override
  Widget build(BuildContext context) {
    final tabIndex = useState(0);

    var size = MediaQuery.of(context).size;
    var style = Theme.of(context).textTheme;
    bool isMobile = SizeChecker.isMobile(context);
    bool isTablet = size.width > 600 && size.width < 900;
    List titles = ["Description", "Technologies"];

    return Container(
      width: size.width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                titles.length,
                (index) => GestureDetector(
                  onTap: () => tabIndex.value = index,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Text(
                          titles[index],
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: tabIndex.value == index
                                ? Constants.orangeColor
                                : Constants.creamColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (tabIndex.value == index)
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.orangeColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            if (tabIndex.value == 0)
              Center(
                child: SizedBox(
                  width: 400,
                  child: Text(
                    item.description!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 29,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (tabIndex.value == 1)
              SizedBox(
                width: 600,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: List.generate(
                    item.technologies!.length,
                    (index) => SkillItem(
                      title: item.technologies![index],
                      isLong: true,
                      lightTitle: true,
                    ),
                  ).toList(),
                ),
              ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
