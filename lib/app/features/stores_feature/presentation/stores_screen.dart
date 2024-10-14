import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/slivers/sliver_search_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/widgets/custom_store_widget.dart';

import '../../../core/widgets/skeleton.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  _StoresScreenState createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  bool _isLoading = true; // Controla el estado de la carga

  @override
  void initState() {
    super.initState();
    // Simula la carga durante 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // Después de 2 segundos, dejamos de cargar
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus
              .unfocus(); // Si quieres liberar el foco, puedes usar esta línea
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                AppText.storesSmart,
                style: textTheme.bodyLarge!.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                ),
              ),
              leadingWidth: 70,
              leading: const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 4),
                child: CustomButtonArrowBack(),
              ),
            ),
            SliverSearchWidget(
                showBackIcon: false, safeAreaTop: 0, focusNode: FocusNode()),

            //SliverToBoxAdapter(child: encuestas_skeleton()),

            // Si está cargando, mostrar el skeleton
            _isLoading
                ? SliverList.builder(
                    itemCount: 10, // Número de skeletons a mostrar
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: tiendas_skeleton(),
                      );
                    },
                  )
                : SliverList.builder(
                    itemCount: 10, // Número de tiendas a mostrar
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CustomStoreWidget(
                          index: index, // Mostrar las tiendas reales
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
