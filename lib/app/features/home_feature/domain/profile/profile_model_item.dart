import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/constants/app_images.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class ProfileModelItem {
  final String image;
  final String title;
  final Widget widget;

  ProfileModelItem(
      {required this.image, required this.title, required this.widget});
}

final List<ProfileModelItem> poinstAndSubscription = [
  ProfileModelItem(
    image: AppImages.wallet,
    title: AppText.myWallet,
    widget: Container(
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Text(
        "50 ps",
      ),
    ),
  ),
  ProfileModelItem(
    image: AppImages.coins,
    title: AppText.sendPoints,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    image: AppImages.fire,
    title: AppText.subcriptionSmart,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
];

final List<ProfileModelItem> winPontsListProfile = [
  ProfileModelItem(
    image: AppImages.coins,
    title: AppText.gameSmart,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    image: AppImages.fire,
    title: AppText.answerAndWind,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
];

final List<ProfileModelItem> smartSupportList = [
  ProfileModelItem(
    image: AppImages.chat,
    title: AppText.chatSmart,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    image: AppImages.coments,
    title: AppText.faq,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    image: AppImages.phoneAlert,
    title: AppText.supportServices,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    image: AppImages.termns,
    title: AppText.termsAndContion,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    image: AppImages.termns,
    title: AppText.privacyPolicy,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
];
