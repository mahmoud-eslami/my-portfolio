import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portfolio/core/extensions/margin_extension.dart';
import 'package:flutter_portfolio/core/extensions/numbers_extension.dart';
import 'package:flutter_portfolio/core/utils/margin_calculator.dart';
import 'package:flutter_portfolio/features/home/data/model/home_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constant/strings.dart';
import '../../provider/home_provider.dart';

class ProjectsOverviewWidget extends HookConsumerWidget {
  const ProjectsOverviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(homeDataProvider).isLoading;
    final data = ref.watch(homeDataProvider).data;

    return isLoading
        ? Container()
        : Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: MediaQuery.of(context).size.width < 600
                    ? 1
                    : 2, // set two items in each row
                childAspectRatio:
                    2 / 2, // set custom aspect ratio (width/height)
                children: List.generate(
                  data.projects!.length,
                  (index) => ProjectItem(
                    item: data.projects![index],
                  ),
                ),
              ).withHorizontalMargin(projectSectionMarginCalculator(context)),
              50.heightSizedBox,
            ],
          );
  }
}

class ProjectItem extends HookConsumerWidget {
  const ProjectItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProjectItemData item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = useState(false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        isHovered.value = true;
      },
      onExit: (event) {
        isHovered.value = false;
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Image.network(
              item.banner!,
              fit: BoxFit.cover,
            ),
          ),
          AnimatedContainer(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(10),
            duration: const Duration(milliseconds: 300),
            color: isHovered.value
                ? Colors.black26.withOpacity(.9)
                : Colors.transparent,
            child: Visibility(
              visible: isHovered.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  10.heightSizedBox,
                  Text(
                    item.description!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  10.heightSizedBox,
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      Strings.viewProject,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ).withHorizontalMargin(10),
            ),
          ),
        ],
      ),
    );
  }
}
