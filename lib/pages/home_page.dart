import 'package:flutter/material.dart';
import 'package:gg_tracker_workspace/data/banco_jogos.dart';
import 'package:gg_tracker_workspace/models/jogo.dart';
import 'package:gg_tracker_workspace/pages/cadastro_page.dart';
import 'package:gg_tracker_workspace/theme/app_colors.dart';
import 'package:gg_tracker_workspace/widgets/jogo_tile.dart';
import 'package:gg_tracker_workspace/widgets/texto_padrao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _abas = [
    'Tudo',
    'Jogando',
    'Completos',
    'Em Espera',
    'Abandonado',
    'Planejamento',
  ];

  void _atualizarTela() {
    setState(() {});
  }

  void _confirmarRemocao(Jogo jogo) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        title: const TextoPadrao(
          texto: 'Remover Jogo',
          isBold: true,
          tamanho: 18,
        ),
        content: TextoPadrao(
          texto: 'Deseja remover ${jogo.nome} da sua lista?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const TextoPadrao(texto: 'Cancelar'),
          ),
          TextButton(
            onPressed: () {
              jogosGlobais.remove(jogo);
              Navigator.pop(ctx);
              _atualizarTela();
            },
            child: const TextoPadrao(texto: 'Remover', cor: AppColors.perigo),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _abas.length,
      child: Scaffold(
        appBar: AppBar(
          title: const TextoPadrao(
            texto: 'GG Tracker',
            tamanho: 24,
            isBold: true,
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: AppColors.destaque,
            labelColor: AppColors.destaque,
            unselectedLabelColor: AppColors.textoSecundario,
            tabs: _abas.map((aba) => Tab(text: aba)).toList(),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: AppColors.card,
              child: Column(
                children: [
                  TextoPadrao(
                    texto:
                        'Total de Jogos na Biblioteca: ${jogosGlobais.length}',
                    cor: AppColors.textoSecundario,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CadastroPage()),
                      ).then((_) => _atualizarTela()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.destaque,
                      ),
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.textoPrincipal,
                      ),
                      label: const TextoPadrao(
                        texto: 'Adicionar Jogo',
                        isBold: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: _abas.map((aba) {
                  final jogosFiltrados = aba == 'Tudo'
                      ? jogosGlobais
                      : jogosGlobais.where((j) => j.status == aba).toList();

                  if (jogosFiltrados.isEmpty) {
                    return const Center(
                      child: TextoPadrao(
                        texto: 'Nenhum jogo nesta categoria.',
                        cor: AppColors.textoSecundario,
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: jogosFiltrados.length,
                    itemBuilder: (context, index) {
                      final jogo = jogosFiltrados[index];
                      return JogoTile(
                        jogo: jogo,
                        onEdit: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CadastroPage(jogo: jogo),
                          ),
                        ).then((_) => _atualizarTela()),
                        onDelete: () => _confirmarRemocao(jogo),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
