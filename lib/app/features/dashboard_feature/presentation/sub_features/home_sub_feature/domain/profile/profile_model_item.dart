import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class ProfileModelItem {
  //final String? image;
  final String title;
  final Widget widget;
  final IconData icon;

  ProfileModelItem(
      {/*this.image,*/ required this.title,
      required this.widget,
      required this.icon});
}

final List<ProfileModelItem> poinstAndSubscription = [
  ProfileModelItem(
    //image: AppImages.wallet,
    icon: Iconsax.wallet_money,
    title: AppText.myWallet,
    widget: Container(
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(999),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "50 ps",
          style:
              TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800),
        ),
      ),
    ),
  ),
  ProfileModelItem(
    //image: AppImages.coins,
    icon: Iconsax.money_change,
    title: AppText.sendPoints,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    //image: AppImages.fire,
    icon: Iconsax.crown,
    title: AppText.subcriptionSmart,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
];
final List<ProfileModelItem> profileList = [
  ProfileModelItem(
    //image: AppImages.fire,
    icon: Iconsax.profile,
    title: AppText.personalInformation,
    widget: const Icon(
      Iconsax.user,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    //image: AppImages.fire,
    icon: Iconsax.map,
    title: AppText.address,
    widget: const Icon(
      Iconsax.map,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    //image: AppImages.fire,
    icon: Iconsax.like_dislike,
    title: AppText.personalPreferences,
    widget: const Icon(
      Iconsax.like_dislike,
      color: AppColors.onPrimary,
    ),
  ),
  // ProfileModelItem(
  //   //image: AppImages.fire,
  //   icon: Iconsax.heart,
  //   title: AppText.myFavorities,
  //   widget: const Icon(
  //     Iconsax.heart4, //5
  //     color: AppColors.onPrimary,
  //   ),
  // ),
];

final List<ProfileModelItem> winPontsListProfile = [
  ProfileModelItem(
    //image: AppImages.coins,
    icon: Iconsax.game,
    title: AppText.gameSmart,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    //image: AppImages.fire,
    icon: Iconsax.task_square,
    title: AppText.answerAndWind,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
];

final List<ProfileModelItem> smartSupportList = [
  ProfileModelItem(
    //image: AppImages.chat,
    icon: Iconsax.send_2,
    title: AppText.chatSmart,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    //image: AppImages.coments,
    icon: Iconsax.message_search,
    title: AppText.faq,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    //image: AppImages.phoneAlert,
    icon: Iconsax.call,
    title: AppText.supportServices,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    //image: AppImages.termns,
    icon: Iconsax.document_text,
    title: AppText.termsAndContion,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
  ProfileModelItem(
    //image: AppImages.termns,
    icon: Iconsax.document_text,
    title: AppText.privacyPolicy,
    widget: const Icon(
      Icons.navigate_next,
      color: AppColors.onPrimary,
    ),
  ),
];
