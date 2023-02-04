import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';
import 'package:flutter_portfolio/core/global_widgets/custom_cache_image.dart';

class ImagePreviewScreen extends StatefulWidget {
  const ImagePreviewScreen({
    super.key,
    required this.images,
  });
  static const String path = "/images";
  final List<String> images;

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  final ScrollController _controller = ScrollController();
  int currentIndex = 0;
  final double _width = 100.0;

  void _animateToIndex(int index) {
    _controller.animateTo(
      index * _width,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: widget.images.isEmpty
          ? const Center(
              child: Text("Keine Bilder"),
            )
          : Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * .05, top: size.width * .05),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Constants.creamColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * .05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          if (currentIndex > 0) {
                            setState(() {});
                            currentIndex--;
                            _animateToIndex(currentIndex);
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Constants.creamColor,
                          size: 16,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * .05),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          if (currentIndex < widget.images.length - 1) {
                            setState(() {});
                            currentIndex++;
                            _animateToIndex(currentIndex);
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Constants.creamColor,
                          size: 16,
                        )),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: CustomCacheImage(
                        width: size.width * .7,
                        path: widget.images[currentIndex],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .07,
                    ),
                    Expanded(
                        flex: 2,
                        child: ListView.builder(
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.images.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Constants.defaultPadding),
                              child: Stack(
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(
                                        Constants.defaultBorderRadius),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: CustomCacheImage(
                                        fit: BoxFit.cover,
                                        path: widget.images[index],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
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
                        )),
                  ],
                ),
              ],
            ),
    );
  }
}
