// ignore_for_file: file_names

import 'package:bm_mobile/model/AppModel.dart';
import 'package:bm_mobile/screens/BMImageSlider.dart';
import 'package:bm_mobile/screens/home/BMBottomNavigation.dart';
import 'package:bm_mobile/screens/home/BMBottomSheet.dart';
import 'package:bm_mobile/screens/home/BMDashboard.dart';
import 'package:bm_mobile/screens/BMListing.dart';
import 'package:bm_mobile/screens/BMSearch.dart';
import 'package:bm_mobile/screens/BMSettings.dart';
import 'package:bm_mobile/screens/home/component/BMProfile.dart';
import 'package:bm_mobile/settings/AppConstant.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/screens/home/BMCards.dart';
import 'package:bm_mobile/screens/login/BMDialog.dart';
import 'package:bm_mobile/screens/login/BMSignIn.dart';
import 'package:bm_mobile/screens/login/BMSignUp.dart';
import 'package:bm_mobile/screens/login/BMWalkthrough.dart';

List<WalkThroughData> mlWalkThroughDataList() {
  List<WalkThroughData> list = [];
  list.add(WalkThroughData(
      imagePath: ml_ic_slide_one,
      title: bm_slide_one,
      subtitle: bm_slide_one_subtitle));
  list.add(WalkThroughData(
      imagePath: ml_ic_slide_three,
      title: bm_slide_three,
      subtitle: bm_slide_three_subtitle));
  list.add(WalkThroughData(
      imagePath: ml_ic_slide_two,
      title: bm_slide_two,
      subtitle: bm_slide_two_subtitle));
  return list;
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(
        id: 1,
        name: 'English',
        languageCode: 'en',
        fullLanguageCode: 'en-US',
        flag: 'images/flag/ic_us.png'),
    LanguageDataModel(
        id: 2,
        name: 'Hindi',
        languageCode: 'hi',
        fullLanguageCode: 'hi-IN',
        flag: 'images/flag/ic_hi.png'),
    LanguageDataModel(
        id: 3,
        name: 'Arabic',
        languageCode: 'ar',
        fullLanguageCode: 'ar-AR',
        flag: 'images/flag/ic_ar.png'),
    LanguageDataModel(
        id: 4,
        name: 'French',
        languageCode: 'fr',
        fullLanguageCode: 'fr-FR',
        flag: 'images/flag/ic_fr.png'),
  ];
}

Future<AppTheme> getAllAppsAndThemes() async {
  AppTheme appTheme = AppTheme();

  appTheme.themes = getThemes();
  appTheme.defaultTheme = getDefaultTheme();

  return appTheme;
}

List<ProTheme> getThemes() {
  List<ProTheme> list = [];
  list.add(ProTheme(
      name: 'e-wallet',
      title_name: 'Theme 5 Screens',
      type: '',
      show_cover: true,
      sub_kits: getEWallet(),
      darkThemeSupported: true));
  return list;
}

List<ProTheme> getEWallet() {
  List<ProTheme> list = [];

  list.add(ProTheme(
      name: 'WalkThrough',
      is_theme: true,
      type: '',
      widget: BMWalkThrough(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'Sign In',
      is_theme: true,
      type: '',
      widget: BMSignIn(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'Sign Up',
      is_theme: true,
      type: '',
      widget: BMSignUp(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'Profile',
      is_theme: true,
      type: '',
      widget: BMProfile(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'Dashboard',
      is_theme: true,
      type: '',
      widget: BMDashboard(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'Settings',
      is_theme: true,
      type: '',
      widget: BMSettings(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'Bottom Navigation',
      is_theme: true,
      type: '',
      widget: BMBottomNavigation(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'BottomSheet',
      is_theme: true,
      type: '',
      widget: BMBottomSheet(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'Image Slider',
      is_theme: true,
      type: '',
      widget: BMImageSlider(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'Search',
      is_theme: true,
      type: '',
      widget: BMSearch(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'Listing',
      is_theme: true,
      type: '',
      widget: BMListing(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'Cards',
      is_theme: true,
      type: '',
      widget: BMCards(),
      darkThemeSupported: true));
  list.add(ProTheme(
      name: 'Dialog',
      is_theme: true,
      type: '',
      widget: BMDialog(),
      darkThemeSupported: true));
  return list;
}

//region Default Theme
ProTheme getDefaultTheme() {
  return ProTheme(
      name: "Default Theme",
      title_name: 'Default Theme',
      type: '',
      show_cover: false,
      darkThemeSupported: true,
      isWebSupported: true);
}
