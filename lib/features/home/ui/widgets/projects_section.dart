import 'package:flutter/material.dart';

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
                  const ProjectItem(
                    imagePath: "images/project1.png",
                    title: "Amastas",
                    description:
                        "Not just a furnished apartment: a home Not just a furnished apartment: a home Not just a furnished apartment: a homeNot just a furnished apartment: a home",
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
                "images/abs_logo.png",
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
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String imagePath, title, description;

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
              child: Image.asset(
                widget.imagePath,
                height: 330,
                width: size.width * .9,
                fit: BoxFit.cover,
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
                    color:
                        isHover ? Constants.orangeColor : Constants.creamColor,
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
    );
  }
}
