// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_if_null_operators

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Future<List<dynamic>?> loadDataFromJson(BuildContext context) async {
  final fakeData = await DefaultAssetBundle.of(context)
      .loadString('assets/integrations/map_point.json');
  return json.decode(fakeData.toString());
}

String intToHex(int i) {
  var s = i.toRadixString(16);
  if (s.length == 8) {
    return '#' + s.substring(2).toUpperCase();
  } else {
    return '#' + s.toUpperCase();
  }
}

Widget networkImage(String? image,
    {String aPlaceholder = "images/integrations/img/placeholder.png",
    double? aWidth,
    double? aHeight,
    var fit = BoxFit.fill}) {
  return image != null && image.isNotEmpty
      ? FadeInImage(
          placeholder: AssetImage(aPlaceholder),
          image: NetworkImage(image),
          width: aWidth != null ? aWidth : null,
          height: aHeight != null ? aHeight : null,
          fit: fit,
        )
      : Image.asset(
          aPlaceholder,
          width: aWidth,
          height: aHeight,
          fit: BoxFit.fill,
        );
}

Widget loadingWidgetMaker() {
  return Container(
    alignment: Alignment.center,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
      margin: const EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(8.0),
        child: const CircularProgressIndicator(strokeWidth: 3),
      ),
    ),
  );
}

Widget commonCachedNetworkImage(
  String? url, {
  double? height,
  double? width,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool usePlaceholderIfUrlEmpty = true,
  double? radius,
  Color? color,
}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return const SizedBox();
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
    );
  } else {
    return Image.asset(url,
            height: height,
            width: width,
            fit: fit,
            alignment: alignment ?? Alignment.center)
        .cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius}) {
  return Image.asset('images/placeholder.jpg',
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
