import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:iconsax/iconsax.dart';
import 'package:puntos_smart_user/app/core/extension/custom_extension.dart';

class SliverHeaderProfile extends StatelessWidget {
  const SliverHeaderProfile({
    super.key,
    required this.size,
    required this.textTheme,
    this.onTap,
  });

  final Size size;
  final TextTheme textTheme;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 12),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          height: 100,
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Stack(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://cdn.sortiraparis.com/images/80/69688/1059564-iron-man-la-renaissance-d-un-heros-en-armure-debarque-sur-disney.jpg',
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(99),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          overlayColor: WidgetStateProperty.all(
                            Colors.black.withOpacity(0.05),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return const PhotoEditModal();
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Iconsax.camera,
                          size: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return const PhotoEditModal();
                                },
                              );
                            },
                            overlayColor: WidgetStateProperty.all(
                              Colors.black.withOpacity(0.05),
                            ),
                            child: const SizedBox(
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tony jaxx",
                    style: textTheme.titleLarge!.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "administrador@gmail.com",
                    style: textTheme.titleSmall!.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoEditModal extends StatelessWidget {
  const PhotoEditModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 4,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          16.hSpace,
          Divider(
            color: Colors.grey.shade200,
          ),
          16.hSpace,
          ListTile(
            leading: const Icon(
              Iconsax.camera,
              color: Colors.grey,
            ),
            title: Text(
              "Tomar foto",
              style: textTheme.bodySmall!.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Iconsax.gallery,
              color: Colors.grey,
            ),
            title: Text(
              "Elegir de la galeria",
              style: textTheme.bodySmall!.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Iconsax.trash,
              color: Colors.redAccent,
            ),
            title: Text(
              "Eliminar foto",
              style: textTheme.bodySmall!.copyWith(
                color: Colors.redAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
