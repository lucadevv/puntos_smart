import 'package:flutter/material.dart';

import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';

class SliverAppbarCouponWidget extends StatelessWidget {
  const SliverAppbarCouponWidget({
    super.key,
    required double sliverAppBarHeight,
  }) : _sliverAppBarHeight = sliverAppBarHeight;

  final double _sliverAppBarHeight;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
        expandedHeight: _sliverAppBarHeight,
        backgroundColor: Colors.white,
        title: Text(
          "Cupones MacDonal's", // Cambia el texto según sea necesario
          style: textTheme.bodyLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        pinned: false,
        leadingWidth: 66,
        automaticallyImplyLeading: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CustomButtonArrowBack(),
        ),
        actions: [
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: AppColors.greyligth,//arrowbacButtonColor
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.share_rounded,
                color: AppColors.blacknew,//black54
              ),
            ),
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 268,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Container(
                          height: 260,
                          width: 276,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaTm0YzW4-aR-q2g_WDVEe0TWINmKtF4qwMg&s',
                                scale: 1,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
