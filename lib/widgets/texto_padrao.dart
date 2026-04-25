import 'package:flutter/material.dart';
import 'package:gg_tracker_workspace/theme/app_colors.dart';

class TextoPadrao extends StatelessWidget {
  final String texto;
  final double tamanho;
  final bool isBold;
  final Color cor;

  const TextoPadrao({
    super.key,
    required this.texto,
    this.tamanho = 14,
    this.isBold = false,
    this.cor = AppColors.textoPrincipal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: tamanho,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: cor,
      ),
    );
  }
}
