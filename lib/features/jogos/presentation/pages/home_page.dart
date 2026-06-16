import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/jogo_provider.dart';
import 'cadastro_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<String> _abas = [
    'Tudo',
    'Jogando',
    'Completos',
    'Em Espera',
    'Abandonado',
    'Planejamento'
  ];

  @override
  Widget build(BuildContext context) {
    final jogosAsync = ref.watch(jogosProvider);

    return DefaultTabController(
      length: _abas.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GG Tracker'),
          bottom: TabBar(
            isScrollable: true,
            tabs: _abas.map((aba) => Tab(text: aba)).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CadastroPage()),
          ),
          child: const Icon(Icons.add),
        ),
        body: jogosAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, stack) => Center(child: Text('Erro: $e')),
          data: (jogos) {
            return TabBarView(
              children: _abas.map((aba) {
                final filtrados = aba == 'Tudo'
                    ? jogos
                    : jogos.where((j) => j.status == aba).toList();

                if (filtrados.isEmpty) {
                  return const Center(
                      child: Text('Nenhum jogo nesta categoria.'));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filtrados.length,
                  itemBuilder: (context, index) {
                    final jogo = filtrados[index];
                    return Card(
                      child: ListTile(
                        title: Text(jogo.nome),
                        subtitle: Text(
                            'Nota: ${jogo.nota} | ${jogo.conquistasAtuais}/${jogo.conquistasTotal} conquistas'),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CadastroPage(jogo: jogo)),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => ref
                              .read(jogoViewModelProvider)
                              .removerJogo(jogo.id),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
