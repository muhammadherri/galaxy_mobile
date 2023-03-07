// ignore_for_file: file_names, use_key_in_widget_constructors, sized_box_for_whitespace, sort_child_properties_last
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/model/BMModels.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:bm_mobile/utils/widgets/BMSliderWidget.dart';
import '../BMColors.dart';
import '../BMConstant.dart';

// ignore: must_be_immutable
class BMSliderWidget extends StatelessWidget {
  List<BMSlider>? mSliderList;

  BMSliderWidget(this.mSliderList);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final Size cardSize = Size(width, width / 1.8);
    return BMCarouselSlider(
      viewportFraction: 0.9,
      height: cardSize.height,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList!.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: cardSize.height,
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(
                        BuildContext, String)?,
                    imageUrl: slider.image,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: cardSize.height,
                  ),
                  Padding(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(
                            bm_slide_one,
                            textColor: t5White,
                            fontSize: textSizeMedium,
                          ),
                          text(slider.balance,
                              textColor: t5White,
                              fontSize: textSizeLarge,
                              fontFamily: fontBold)
                        ],
                      ),
                      padding: const EdgeInsets.all(14)),
                  Container(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(
                                bm_slide_two,
                                textColor: t5White,
                                fontSize: textSizeMedium,
                              ),
                              text(slider.accountNo,
                                  textColor: t5White, fontSize: textSizeNormal)
                            ],
                          ),
                        ),
                        text("VISA",
                            textColor: t5White,
                            fontSize: textSizeLarge,
                            fontFamily: fontBold)
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
