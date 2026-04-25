import 'package:flutter/material.dart';
import 'package:gg_tracker_workspace/models/jogo.dart';
import 'package:gg_tracker_workspace/theme/app_colors.dart';
import 'package:gg_tracker_workspace/widgets/delete_icon.dart';
import 'package:gg_tracker_workspace/widgets/texto_padrao.dart';

class JogoTile extends StatelessWidget {
  final Jogo jogo;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const JogoTile({
    super.key,
    required this.jogo,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEdit,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextoPadrao(texto: jogo.nome, tamanho: 18, isBold: true),
                  const SizedBox(height: 4),
                  TextoPadrao(
                    texto:
                        'Conquistas: ${jogo.conquistasAtuais}/${jogo.conquistasTotal} | Nota: ${jogo.nota}',
                    cor: AppColors.textoSecundario,
                  ),
                  const SizedBox(height: 4),
                  TextoPadrao(
                    texto: 'Início: ${jogo.dataInicio}  Fim: ${jogo.dataFim}',
                    tamanho: 12,
                    cor: AppColors.textoSecundario,
                  ),
                ],
              ),
            ),
            DeleteIcon(onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}
