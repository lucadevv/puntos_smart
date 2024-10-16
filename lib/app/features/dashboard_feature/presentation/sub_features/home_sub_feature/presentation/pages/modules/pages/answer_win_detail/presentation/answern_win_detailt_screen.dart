import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:puntos_smart_user/app/core/constants/app_text.dart';
import 'package:puntos_smart_user/app/core/constants/name_routes.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';
import 'package:puntos_smart_user/app/core/widgets/custom_arrow_back.dart';
import 'package:puntos_smart_user/app/features/auth_feature/presentation/widgets/custom_button_widget.dart';

class AnswerWinDetailScreen extends StatefulWidget {
  final int idAnswer;
  const AnswerWinDetailScreen({super.key, required this.idAnswer});

  @override
  AnswerWinDetailScreenState createState() => AnswerWinDetailScreenState();
}

class AnswerWinDetailScreenState extends State<AnswerWinDetailScreen> {
  int currentQuestionIndex = 0; // Índice de la pregunta actual
  List<double> progressValues = [0.0, 0.0, 0.0, 0.0, 0.0]; // Progreso inicial
  Set<int> selectedAnswers = {}; // Conjunto de respuestas seleccionadas

  // Método para seleccionar/deseleccionar una respuesta
  void toggleAnswer(int index) {
    setState(() {
      if (selectedAnswers.contains(index)) {
        selectedAnswers.remove(index);
      } else {
        selectedAnswers.add(index);
      }
    });
  }

  // Método para verificar si el botón debe estar habilitado o no
  bool get isButtonEnabled => selectedAnswers.isNotEmpty;

  // Método para enviar la respuesta
  void submitAnswer() {
    setState(() {
      // Marcar la pregunta actual como respondida
      progressValues[currentQuestionIndex] = 1.0;

      // Resetear las respuestas seleccionadas
      selectedAnswers.clear();

      // Ir a la siguiente pregunta si hay más disponibles
      if (currentQuestionIndex < surveys.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              AppText.answer,
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
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Categoría de la pregunta
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, 1.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        surveys[currentQuestionIndex].category,
                        // key: ValueKey<String>(
                        // surveys[currentQuestionIndex].category),
                        style: textTheme.titleSmall!.copyWith(
                          color: AppColors.descriptionColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Título de la encuesta

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(
                                  1.0, 0.0), // Desliza desde la derecha
                              end: Offset.zero,
                            ).animate(CurvedAnimation(
                              parent: animation,
                              curve:
                                  Curves.easeInOut, // Efecto elástico al entrar
                            )),
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        surveys[currentQuestionIndex].title,
                        key: ValueKey<String>(
                            surveys[currentQuestionIndex].title),
                        style: textTheme.titleLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),
                    // Barra de progreso para las preguntas
                    Row(
                      children: List.generate(surveys.length, (index) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(10),
                              color: index <= currentQuestionIndex
                                  ? AppColors.onPrimary
                                  : Colors.grey, // Cambiar color según progreso
                              value: progressValues[
                                  index], // Progreso de la pregunta
                              minHeight: 5,
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Pregunta ${currentQuestionIndex + 1}',
                      style: textTheme.labelMedium!.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(
                                  1.0, 0.0), // Desliza desde la derecha
                              end: Offset.zero,
                            ).animate(CurvedAnimation(
                              parent: animation,
                              curve:
                                  Curves.easeInOut, // Efecto elástico al entrar
                            )),
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        surveys[currentQuestionIndex].question,
                        key: ValueKey<String>(
                            surveys[currentQuestionIndex].question),
                        style: textTheme.titleLarge!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                    // Lista de respuestas posibles
                    Column(
                      children: List.generate(
                          surveys[currentQuestionIndex].possibleAnswers.length,
                          (index) {
                        final item = surveys[currentQuestionIndex]
                            .possibleAnswers[index];
                        final isSelected = selectedAnswers.contains(index);
                        return GestureDetector(
                          onTap: () => toggleAnswer(index),
                          child: AnimatedSwitcher(
                            duration:
                                Duration(milliseconds: 600 + (index * 200)),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(
                                        1.0, 0.0), // Desliza desde la derecha
                                    end: Offset.zero,
                                  ).animate(CurvedAnimation(
                                    parent: animation,
                                    curve: Curves
                                        .easeInOut, // Efecto elástico al entrar
                                  )),
                                  child: child,
                                ),
                              );
                            },
                            child: Container(
                              key: ValueKey<String>(item),
                              height: 50,
                              width: 296,
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.only(left: 16),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.onPrimary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.onPrimary
                                      : Colors.grey,
                                ),
                              ),
                              child: Text(
                                item,
                                style: textTheme.titleMedium!.copyWith(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const Spacer(),

                    SafeArea(
                      left: false,
                      top: false,
                      right: false,
                      bottom: true,
                      child: CustomButtonWidget(
                          onTap: isButtonEnabled
                              ? () {
                                  if (currentQuestionIndex ==
                                      surveys.length - 1) {
                                    context.go(NameRoutes.dashboardScreen);
                                  } else {
                                    submitAnswer();
                                  }
                                }
                              : null,
                          title: currentQuestionIndex != surveys.length - 1
                              ? 'Continuar'
                              : 'Finalizar',
                          width: size.width),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Survey {
  String category;
  String title;
  String question;
  List<String> possibleAnswers;

  Survey({
    required this.category,
    required this.title,
    required this.question,
    required this.possibleAnswers,
  });

  @override
  String toString() {
    return 'Category: $category\nTitle: $title\nQuestion: $question\nPossible Answers: ${possibleAnswers.join(', ')}';
  }
}

List<Survey> surveys = [
  Survey(
    category: 'Tecnología',
    title: 'Opinión sobre IA',
    question:
        '¿Qué opinas del uso de la inteligencia artificial en el día a día?',
    possibleAnswers: ['Muy positiva', 'Positiva', 'Neutral', 'Negativa'],
  ),
  Survey(
    category: 'Salud',
    title: 'Hábitos de ejercicio',
    question: '¿Con qué frecuencia realizas ejercicio físico?',
    possibleAnswers: ['Diario', 'Semanal', 'Mensual', 'Rara vez'],
  ),
  Survey(
    category: 'Alimentación',
    title: 'Preferencias alimenticias',
    question: '¿Qué tipo de alimentación prefieres?',
    possibleAnswers: ['Vegetariana', 'Vegana', 'Omnívora', 'Pescetariana'],
  ),
  Survey(
    category: 'Medio Ambiente',
    title: 'Conciencia ambiental',
    question: '¿Cuál es tu grado de preocupación por el medio ambiente?',
    possibleAnswers: ['Muy alto', 'Alto', 'Moderado', 'Bajo'],
  ),
  Survey(
    category: 'Educación',
    title: 'Estilos de aprendizaje',
    question: '¿Cuál es tu estilo de aprendizaje preferido?',
    possibleAnswers: ['Visual', 'Auditivo', 'Kinestésico', 'Lectura/escritura'],
  ),
];
