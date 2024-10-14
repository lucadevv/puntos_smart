import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntos_smart_user/app/features/home_feature/presentation/bloc/home_bloc.dart';

class SliverBannersHomeWidget extends StatefulWidget {
  const SliverBannersHomeWidget({
    super.key,
  });

  @override
  State<SliverBannersHomeWidget> createState() =>
      _SliverBannersHomeWidgetState();
}

class _SliverBannersHomeWidgetState extends State<SliverBannersHomeWidget> {
  bool myAnimation = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((time) {
      setState(() {
        myAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final bannerList = state.bannerList;
          return Container(
            height: 180,
            width: size.width,
            padding: const EdgeInsets.only(left: 16),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: bannerList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, idx) {
                // final item =
                return AnimatedContainer(
                  duration: Duration(milliseconds: 650 + ((idx) * 250)),
                  transform:
                      Matrix4.translationValues(myAnimation ? 0 : -560, 0, 0),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: 260,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.primaries[idx],
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
