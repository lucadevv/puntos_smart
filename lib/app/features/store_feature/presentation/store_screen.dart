import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/slivers/sliver_appbar_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/slivers/sliver_categories.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/slivers/sliver_desc_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/slivers/sliver_search_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/slivers/sliver_textspan_widget.dart';
import 'package:puntos_smart_user/app/features/store_feature/presentation/widgets/floatingb_widget.dart';

class StoreScreen extends StatefulWidget {
  final int index;
  const StoreScreen({super.key, required this.index});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int _indexSelected = 0;
  late ScrollController scrollController;

  final FocusNode _focusNode = FocusNode();
  bool _showBackIcon = false;
  final double _sliverAppBarHeight = 300.0;

  Map<int, GlobalKey> categoryKeys = {};
  // Mapa para almacenar las alturas dinámicas de cada categoría
  Map<int, double> categoryHeights = {};
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    initializeCategoryKeys();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            450.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      }
    });
    super.initState();
  }

  void _scrollListener() {
    if (scrollController.hasClients) {
      double scrollPosition = scrollController.offset;

      // Detectar cuando el SliverAppBar está completamente fuera de la pantalla
      if (scrollPosition >= _sliverAppBarHeight && !_showBackIcon) {
        setState(() {
          _showBackIcon = true; // Actualizar el estado a oculto
        });
      } else if (scrollPosition < _sliverAppBarHeight && _showBackIcon) {
        setState(() {
          _showBackIcon = false; // El AppBar vuelve a ser visible
        });
      }
    }
  }

  // Método para inicializar GlobalKeys dinámicamente
  void initializeCategoryKeys() {
    for (int i = 0; i < categorias.length; i++) {
      categoryKeys[i] = GlobalKey();
    }
  }

  void _scrollToCategory2(int index) {
    final keyContext = categoryKeys[index]!.currentContext;

    if (keyContext != null) {
      // Si el contexto está disponible, usa Scrollable.ensureVisible
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // Si el contexto no está disponible, calcula la posición manualmente
      double position = _calculateScrollPosition(index);

      // Asegúrate de que la posición es válida antes de hacer el scroll
      if (position.isFinite && position >= 0) {
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        debugPrint("Error: Posición de scroll inválida: $position");
      }
    }
  }

  double _calculateScrollPosition(int index) {
    double position = 0;

    // Sumar las alturas de todas las categorías anteriores
    for (int i = 0; i < index; i++) {
      if (categoryHeights.containsKey(i)) {
        position += categoryHeights[i]!;
      } else {
        // Si no se tiene la altura de una categoría, evita cálculos incorrectos
        position += 300.0; // Ajusta esto según tu altura estimada
      }
    }

    // Devuelve una posición finita
    return position.isFinite ? position : 0.0;
  }

  void _registerHeight(int index, double height) {
    try {
      categoryHeights[index] = height;
    } catch (e) {
      debugPrint("Error al registrar la altura de la categoría $index: $e");
    }
  }

  void pageSelected(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    double safeAreaTop = MediaQuery.of(context).padding.top;

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
          controller: scrollController,
          slivers: [
            SliverAppbarWidget(
              sliverAppBarHeight: _sliverAppBarHeight,
              textTheme: textTheme,
              index: widget.index,
            ),
            const SliverTextSpanWidget(),
            SliverSearchWidget(
              showBackIcon: _showBackIcon,
              safeAreaTop: safeAreaTop,
              focusNode: _focusNode,
            ),
            SliverCategoriesWidget(
              onSelected: (int value) {
                pageSelected(value);
                _scrollToCategory2(value);
              },
              indexSelected: _indexSelected,
            ),
            SliverDescWidget(categoryKeys: categoryKeys, textTheme: textTheme),
            SliverList.builder(
              itemCount: categorias.length - 1,
              itemBuilder: (context, index) {
                final category = categorias[index + 1];
                return LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    // Registrar la altura del widget una vez renderizado
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _registerHeight(index, constraints.maxHeight);
                    });
                    return Container(
                      key: categoryKeys[index + 1],
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              category,
                              style: textTheme.headlineSmall!.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, subIndex) {
                              return Container(
                                height: 144,
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(
                                  //   color: AppColors.textfield,
                                  // ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.greynew.withOpacity(
                                          0.2), // Color de la sombra con opacidad
                                      spreadRadius: 1, // Extensión de la sombra
                                      blurRadius: 8, // Desenfoque de la sombra
                                      offset: Offset(0,
                                          4), // Desplazamiento de la sombra (x, y)
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: InkWell(
                                        onTap: () {
                                          context.push(
                                              '${NameRoutes.productDetailScreen}/$subIndex');
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Cuarto de Libra con queso",
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                            ),
                                            const SizedBox(height: 12),
                                            Text(
                                              "Hamburguesa de carne 100% de res con queso doble queso cheddar, cebolla ...",
                                              style: textTheme.labelSmall!
                                                  .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 4,
                                            ),
                                            const Spacer(),
                                            Text(
                                              "s/ 60.00",
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 144,
                                        width: 100,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 0.0),
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: AppColors.textfield,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      1.0, 1.0),
                                              child: FloatingActionButtonWidget(
                                                  onTap: () {
                                                    context.push(
                                                        '${NameRoutes.couponsScreen}/1/$subIndex'); // Donde '1' es el idTienda y '2' es el idCoupon
                                                  },
                                                  heigh: 40,
                                                  width: 40),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButtonWidget(
          onTap: () {
            context.push('${NameRoutes.couponsScreen}/1');
          },
          heigh: 60,
          width: 60,
          floating: true,
        ),
      ),
    );
  }
}
