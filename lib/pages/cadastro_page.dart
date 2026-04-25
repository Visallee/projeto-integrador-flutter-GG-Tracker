import 'package:flutter/material.dart';
import 'package:gg_tracker_workspace/data/banco_jogos.dart';
import 'package:gg_tracker_workspace/models/jogo.dart';
import 'package:gg_tracker_workspace/theme/app_colors.dart';
import 'package:gg_tracker_workspace/widgets/texto_padrao.dart';

class CadastroPage extends StatefulWidget {
  final Jogo? jogo;

  const CadastroPage({super.key, this.jogo});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _conquistasAtuaisController = TextEditingController();
  final _conquistasTotalController = TextEditingController();
  final _notaController = TextEditingController();
  final _dataInicioController = TextEditingController();
  final _dataFimController = TextEditingController();

  String _statusSelecionado = 'Jogando';
  final List<String> _opcoesStatus = [
    'Tudo',
    'Jogando',
    'Completos',
    'Em Espera',
    'Abandonado',
    'Planejamento',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.jogo != null) {
      _nomeController.text = widget.jogo!.nome;
      _statusSelecionado = widget.jogo!.status;
      _conquistasAtuaisController.text = widget.jogo!.conquistasAtuais
          .toString();
      _conquistasTotalController.text = widget.jogo!.conquistasTotal.toString();
      _notaController.text = widget.jogo!.nota.toString();
      _dataInicioController.text = widget.jogo!.dataInicio;
      _dataFimController.text = widget.jogo!.dataFim;
    }
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      if (widget.jogo == null) {
        jogosGlobais.add(
          Jogo(
            id: DateTime.now().toString(),
            nome: _nomeController.text,
            status: _statusSelecionado == 'Tudo'
                ? 'Jogando'
                : _statusSelecionado,
            conquistasAtuais: int.parse(_conquistasAtuaisController.text),
            conquistasTotal: int.parse(_conquistasTotalController.text),
            nota: double.parse(_notaController.text),
            dataInicio: _dataInicioController.text,
            dataFim: _dataFimController.text,
          ),
        );
      } else {
        widget.jogo!.nome = _nomeController.text;
        widget.jogo!.status = _statusSelecionado == 'Tudo'
            ? 'Jogando'
            : _statusSelecionado;
        widget.jogo!.conquistasAtuais = int.parse(
          _conquistasAtuaisController.text,
        );
        widget.jogo!.conquistasTotal = int.parse(
          _conquistasTotalController.text,
        );
        widget.jogo!.nota = double.parse(_notaController.text);
        widget.jogo!.dataInicio = _dataInicioController.text;
        widget.jogo!.dataFim = _dataFimController.text;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Jogo salvo com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextoPadrao(texto: 'Detalhes do Jogo', tamanho: 20),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                style: const TextStyle(color: AppColors.textoPrincipal),
                decoration: const InputDecoration(labelText: 'Nome do Jogo'),
                validator: (val) => val!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _statusSelecionado,
                dropdownColor: AppColors.card,
                style: const TextStyle(color: AppColors.textoPrincipal),
                items: _opcoesStatus
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (val) => setState(() => _statusSelecionado = val!),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _conquistasAtuaisController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: AppColors.textoPrincipal),
                      decoration: const InputDecoration(
                        labelText: 'Conquistas Atuais',
                      ),
                      validator: (val) => val!.isEmpty ? 'Obrigatório' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _conquistasTotalController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: AppColors.textoPrincipal),
                      decoration: const InputDecoration(
                        labelText: 'Total Conquistas',
                      ),
                      validator: (val) => val!.isEmpty ? 'Obrigatório' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _notaController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: AppColors.textoPrincipal),
                decoration: const InputDecoration(labelText: 'Nota (0 a 10)'),
                validator: (val) => val!.isEmpty ? 'Obrigatório' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dataInicioController,
                      style: const TextStyle(color: AppColors.textoPrincipal),
                      decoration: const InputDecoration(
                        labelText: 'Data Início',
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _dataFimController,
                      style: const TextStyle(color: AppColors.textoPrincipal),
                      decoration: const InputDecoration(labelText: 'Data Fim'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _salvar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.destaque,
                  ),
                  child: const TextoPadrao(texto: 'Salvar Jogo', isBold: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
