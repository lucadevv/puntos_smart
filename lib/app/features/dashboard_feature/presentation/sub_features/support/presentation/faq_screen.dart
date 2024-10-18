import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_text.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/custom_arrow_back.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              AppText.faq,
              style: textTheme.bodyLarge!.copyWith(
                color: AppColors.blacknew,
                fontWeight: FontWeight.w600,
              ),
            ),
            leadingWidth: 70,
            leading: const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 4),
              child: CustomButtonArrowBack(),
            ),
          ),

          SliverList.builder(
            itemCount: 10, // Número de tiendas a mostrar
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(bottom: 0, top: 0),
                  child: FAQItem(
                    answer:
                        'El estado en Flutter es manejado por los StatefulWidgets y el State asociado.',
                    question: '¿Cómo funciona el estado en Flutter? ',
                  ));
            },
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         FAQItem(
          //           question: "¿Qué es Flutter?",
          //           answer:
          //               "Flutter es un SDK de Google para construir aplicaciones nativas.",
          //         ),
          //         FAQItem(
          //           question:
          //               "¿Cómo funciona el estado en Flutter?¿Cómo funciona el estado en Flutter?¿Cómo funciona el estado en Flutter?¿Cómo funciona el estado en Flutter?",
          //           answer:
          //               "El estado en Flutter es manejado por los StatefulWidgets y el State asociado.",
          //         ),
          //         // Añadir más preguntas y respuestas aquí
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12.0),
                  topRight: const Radius.circular(12.0),
                  bottomLeft: _isExpanded ? Radius.zero : Radius.circular(12.0),
                  bottomRight:
                      _isExpanded ? Radius.zero : const Radius.circular(12.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greynew.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                widget.question,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blacknew,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            //margin: const EdgeInsets.all(16.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: _isExpanded
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                      )
                    : BorderRadius.zero,
                boxShadow: _isExpanded
                    ? [
                        BoxShadow(
                          color: AppColors.greynew.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              height: _isExpanded ? null : 0,
              child: _isExpanded
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        widget.answer,
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.blacknew),
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
