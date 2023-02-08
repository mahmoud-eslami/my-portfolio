import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/global_widgets/custom_button.dart';
import 'package:flutter_portfolio/core/global_widgets/custom_cache_image.dart';
import 'package:flutter_portfolio/core/utils/url_launcher.dart';
import 'package:flutter_portfolio/features/home/data/model/home_model.dart';
import 'package:flutter_portfolio/features/home/ui/image_preview/image_preview_screen.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/size_checker.dart';
import 'widgets/technologies_builder.dart';

class PorjectDetailScreen extends StatelessWidget {
  const PorjectDetailScreen({super.key, required this.item});

  final Projects item;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var style = Theme.of(context).textTheme;
    bool isMobile = SizeChecker.isMobile(context);
    bool isTablet = size.width > 600 && size.width < 900;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: isMobile
                ? size.width * .8
                : isTablet
                    ? size.width * .7
                    : size.width * .5,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .03,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back)),
                      Text(
                        "Project Details",
                        style: style.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  Stack(
                    children: [
                      Material(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            Constants.defaultBorderRadius,
                          ),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        child: CustomCacheImage(
                          width: double.infinity,
                          height: size.width * (isMobile ? .5 : .3),
                          path: item.banner!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Constants.defaultPadding),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CustomButton(
                            title: "More Images",
                            textStyle: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImagePreviewScreen(
                                        images: item.images ?? []),
                                  ));
                            },
                            width: isMobile
                                ? size.width * .3
                                : isTablet
                                    ? size.width * .2
                                    : Constants.desktopButtonWidth,
                            height: isMobile
                                ? Constants.mobileBtnHeight
                                : Constants.desktopButtonHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Title : ",
                          style: style.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: item.title ?? "Unknown",
                          style: style.headlineSmall?.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Description : ",
                          style: style.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: item.description ?? "Unknown",
                          style: style.headlineSmall?.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  if (item.isOpenSource ?? false)
                    GestureDetector(
                      onTap: () {
                        launchTheUrl(item.link ?? "");
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Link : ",
                              style: style.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "Open Source",
                              style: style.headlineSmall?.copyWith(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              mouseCursor: SystemMouseCursors.click,
                            ),
                          ],
                        ),
                      ),
                    ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Technologies : ",
                          style: style.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TechnologiesBuilder(techs: item.technologies ?? []),
                  SizedBox(
                    height: size.height * .03,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
