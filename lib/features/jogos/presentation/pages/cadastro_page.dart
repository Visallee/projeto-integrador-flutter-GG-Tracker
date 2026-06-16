import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/app_database.dart';
import '../viewmodels/jogo_provider.dart';

class CadastroPage extends ConsumerStatefulWidget {
  final Jogo? jogo;
  const CadastroPage({super.key, this.jogo});

  @override
  ConsumerState<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends ConsumerState<CadastroPage> {
  final formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final conquistasAtuaisController = TextEditingController();
  final conquistasTotalController = TextEditingController();
  final notaController = TextEditingController();
  final dataInicioController = TextEditingController();
  final dataFimController = TextEditingController();

  String statusSelecionado = 'Jogando';
  final List<String> opcoesStatus = [
    'Tudo',
    'Jogando',
    'Completos',
    'Em Espera',
    'Abandonado',
    'Planejamento'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.jogo != null) {
      nomeController.text = widget.jogo!.nome;
      statusSelecionado =
          widget.jogo!.status == 'Tudo' ? 'Jogando' : widget.jogo!.status;
      conquistasAtuaisController.text =
          widget.jogo!.conquistasAtuais.toString();
      conquistasTotalController.text = widget.jogo!.conquistasTotal.toString();
      notaController.text = widget.jogo!.nota.toString();
      dataInicioController.text = widget.jogo!.dataInicio;
      dataFimController.text = widget.jogo!.dataFim;
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    conquistasAtuaisController.dispose();
    conquistasTotalController.dispose();
    notaController.dispose();
    dataInicioController.dispose();
    dataFimController.dispose();
    super.dispose();
  }

  Future<void> salvarJogo() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    await ref.read(jogoViewModelProvider).salvarJogo(
          jogoExistente: widget.jogo,
          nome: nomeController.text.trim(),
          status: statusSelecionado == 'Tudo' ? 'Jogando' : statusSelecionado,
          conquistasAtuais: int.tryParse(conquistasAtuaisController.text) ?? 0,
          conquistasTotal: int.tryParse(conquistasTotalController.text) ?? 0,
          nota: double.tryParse(notaController.text) ?? 0.0,
          dataInicio: dataInicioController.text.trim(),
          dataFim: dataFimController.text.trim(),
        );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.jogo == null ? 'Novo Jogo' : 'Editar Jogo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                    labelText: 'Nome', border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? 'Obrigatorio' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: statusSelecionado,
                decoration: const InputDecoration(
                    labelText: 'Status', border: OutlineInputBorder()),
                items: opcoesStatus
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (val) => setState(() => statusSelecionado = val!),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: conquistasAtuaisController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Conquistas',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: conquistasTotalController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Total', border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: notaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Nota (0 a 10)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: salvarJogo,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
