import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

// Classe MeuApp - Ponto de início da preparação dos Widgets
class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Montador de Perfil de Treino',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),

      // Aponta Home para a classe MontadorPerfilTreinoTela
      home: const MontadorPerfilTreinoTela(),
    );
  }
}

class MontadorPerfilTreinoTela extends StatefulWidget {
  const MontadorPerfilTreinoTela({super.key});

  @override
  State<MontadorPerfilTreinoTela> createState() =>
      _MontadorPerfilTreinoTelaState();
}

// Enum para representar o nível de experiência
enum NivelExperiencia {
  iniciante,
  intermediario,
  avancado,
}

class _MontadorPerfilTreinoTelaState
    extends State<MontadorPerfilTreinoTela> {

  // --- 1. Valores Padrão (para reset) ---

  static const String? _objetivoPadrao = null;
  static const NivelExperiencia? _nivelPadrao = null;
  static const double _tempoPadrao = 60.0;
  static const int? _frequenciaPadrao = null;
  static const bool _notificacaoPadrao = false;
  static const bool _termosPadrao = false;

  static const List<String> _restricoesDisponiveis = [
    'Vegetariano',
    'Vegano',
    'Sem lactose',
    'Sem glúten',
    'Low Carb',
  ];

  static const List<String> _restricoesPadrao = [];

  static const List<String> _alergiasPadrao = [];


  // --- 2. Variáveis de Estado ---

  String? _objetivoSelecionado;
  NivelExperiencia? _nivelSelecionado;
  late double _tempoSelecionado;
  int? _frequenciaSelecionada;
  late bool _notificacoesAgua;
  late bool _termosAceitos;

  late List<String> _restricoesSelecionadas;
  late List<String> _alergiasSelecionadas;

  final TextEditingController _alergiaController =
      TextEditingController();


  @override
  void initState() {
    super.initState();
    _resetarValores();
  }


  // --- 3. Resetar valores ---

  void _resetarValores() {
    _objetivoSelecionado = _objetivoPadrao;
    _nivelSelecionado = _nivelPadrao;
    _tempoSelecionado = _tempoPadrao;
    _frequenciaSelecionada = _frequenciaPadrao;
    _notificacoesAgua = _notificacaoPadrao;
    _termosAceitos = _termosPadrao;

    _restricoesSelecionadas =
        List<String>.from(_restricoesPadrao);

    _alergiasSelecionadas =
        List<String>.from(_alergiasPadrao);

    _alergiaController.clear();

    print('[DEBUG] Perfil resetado para os valores padrão.');

    setState(() {});
  }


  // --- 4. Adicionar alergia ---

  void _adicionarAlergia() {
    final String alergia =
        _alergiaController.text.trim();

    if (alergia.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Digite uma alergia antes de adicionar.'),
        ),
      );
      return;
    }

    final bool jaExiste = _alergiasSelecionadas.any(
      (item) => item.toLowerCase() == alergia.toLowerCase(),
    );

    if (jaExiste) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Essa alergia já foi adicionada.'),
        ),
      );
      return;
    }

    setState(() {
      _alergiasSelecionadas.add(alergia);
      _alergiaController.clear();
    });

    print('[DEBUG - InputChip] Alergia adicionada: $alergia');
  }


  // --- 5. Remover alergia ---

  void _removerAlergia(String alergia) {
    setState(() {
      _alergiasSelecionadas.remove(alergia);
    });

    print('[DEBUG - InputChip] Alergia removida: $alergia');
  }


  // --- 6. Validar formulário ---

  bool _validarFormulario() {

    if (_objetivoSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecione o objetivo do treino.'),
        ),
      );
      return false;
    }

    if (_nivelSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Informe o nível de experiência.'),
        ),
      );
      return false;
    }

    if (_frequenciaSelecionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecione a frequência semanal.'),
        ),
      );
      return false;
    }

    if (!_termosAceitos) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'É necessário aceitar os termos e condições.',
          ),
        ),
      );
      return false;
    }

    return true;
  }


  // --- 7. Gerar Plano ---

  void _gerarPlano() {

    if (!_validarFormulario()) {
      return;
    }

    print('==================================');
    print('       PERFIL DE TREINO           ');
    print('==================================');
    print('Objetivo: $_objetivoSelecionado');
    print('Nível: $_nivelSelecionado');
    print('Restrições: $_restricoesSelecionadas');
    print('Alergias: $_alergiasSelecionadas');
    print('Tempo diário: ${_tempoSelecionado.round()} minutos');
    print('Frequência: $_frequenciaSelecionada dias por semana');
    print('Notificações de água: $_notificacoesAgua');
    print('Termos aceitos: $_termosAceitos');
    print('==================================');

    _mostrarResumo();
  }


  // --- 8. BottomSheet ---

  void _mostrarResumo() {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Seu perfil de treino',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall,
                ),

                const SizedBox(height: 20),

                Text(
                  'Objetivo',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),

                Text(_objetivoSelecionado!),

                const SizedBox(height: 12),

                Text(
                  'Nível',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),

                Text(
                  _nivelSelecionado
                      .toString()
                      .split('.')
                      .last,
                ),

                const SizedBox(height: 12),

                Text(
                  'Restrições alimentares',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),

                Text(
                  _restricoesSelecionadas.isEmpty
                      ? 'Nenhuma'
                      : _restricoesSelecionadas.join(', '),
                ),

                const SizedBox(height: 12),

                Text(
                  'Alergias',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),

                Text(
                  _alergiasSelecionadas.isEmpty
                      ? 'Nenhuma'
                      : _alergiasSelecionadas.join(', '),
                ),

                const SizedBox(height: 12),

                Text(
                  'Tempo diário',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),

                Text(
                  '${_tempoSelecionado.round()} minutos',
                ),

                const SizedBox(height: 12),

                Text(
                  'Frequência',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),

                Text(
                  '$_frequenciaSelecionada dias por semana',
                ),

                const SizedBox(height: 12),

                Text(
                  'Notificações de água',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),

                Text(
                  _notificacoesAgua
                      ? 'Ativadas'
                      : 'Desativadas',
                ),

                const SizedBox(height: 12),

                Text(
                  'Termos',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),

                const Text('Aceitos'),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Fechar'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Montador de Perfil de Treino'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // --- 1. Objetivo do treino ---

            Text(
              'Objetivo do treino',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),

            const SizedBox(height: 8),

            SegmentedButton<String>(
              emptySelectionAllowed: true,
              segments: const [
                ButtonSegment(
                  value: 'Emagrecimento',
                  label: Text('Emagrecimento'),
                ),
                ButtonSegment(
                  value: 'Hipertrofia',
                  label: Text('Hipertrofia'),
                ),
                ButtonSegment(
                  value: 'Condicionamento',
                  label: Text('Condicionamento'),
                ),
              ],
              selected: _objetivoSelecionado == null
                  ? <String>{}
                  : {_objetivoSelecionado!},
              onSelectionChanged: (Set<String> selecionado) {

                setState(() {
                  _objetivoSelecionado =
                      selecionado.isEmpty
                          ? null
                          : selecionado.first;
                });

                print(
                  '[DEBUG - SegmentedButton] '
                  'Objetivo: $_objetivoSelecionado',
                );
              },
            ),

            const Divider(height: 32),


            // --- 2. Nível de experiência ---

            Text(
              'Nível de experiência',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),

            const SizedBox(height: 8),

            Wrap(
              spacing: 8,

              children: [

                ChoiceChip(
                  label: const Text('Iniciante'),
                  selected:
                      _nivelSelecionado ==
                          NivelExperiencia.iniciante,
                  onSelected: (selecionado) {

                    if (selecionado) {
                      setState(() {
                        _nivelSelecionado =
                            NivelExperiencia.iniciante;
                      });
                    }

                  },
                ),

                ChoiceChip(
                  label: const Text('Intermediário'),
                  selected:
                      _nivelSelecionado ==
                          NivelExperiencia.intermediario,
                  onSelected: (selecionado) {

                    if (selecionado) {
                      setState(() {
                        _nivelSelecionado =
                            NivelExperiencia.intermediario;
                      });
                    }

                  },
                ),

                ChoiceChip(
                  label: const Text('Avançado'),
                  selected:
                      _nivelSelecionado ==
                          NivelExperiencia.avancado,
                  onSelected: (selecionado) {

                    if (selecionado) {
                      setState(() {
                        _nivelSelecionado =
                            NivelExperiencia.avancado;
                      });
                    }

                  },
                ),
              ],
            ),

            const Divider(height: 32),


            // --- 3. Restrições alimentares ---

            Text(
              'Restrições alimentares',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),

            const SizedBox(height: 8),

            Wrap(
              spacing: 8,

              children:
                  _restricoesDisponiveis.map((restricao) {

                final bool selecionado =
                    _restricoesSelecionadas
                        .contains(restricao);

                return FilterChip(
                  label: Text(restricao),
                  selected: selecionado,

                  onSelected: (bool valor) {

                    setState(() {

                      if (valor) {
                        _restricoesSelecionadas
                            .add(restricao);
                      } else {
                        _restricoesSelecionadas
                            .remove(restricao);
                      }

                    });

                    print(
                      '[DEBUG - FilterChip] '
                      '$restricao: $valor',
                    );
                  },
                );

              }).toList(),
            ),

            const Divider(height: 32),


            // --- 4. Alergias ---

            Text(
              'Alergias',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),

            const SizedBox(height: 8),

            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: _alergiaController,
                    decoration: const InputDecoration(
                      labelText: 'Digite uma alergia',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) {
                      _adicionarAlergia();
                    },
                  ),
                ),

                const SizedBox(width: 8),

                ElevatedButton(
                  onPressed: _adicionarAlergia,
                  child: const Text('Adicionar'),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              children:
                  _alergiasSelecionadas.map((alergia) {

                return InputChip(
                  label: Text(alergia),

                  onDeleted: () {
                    _removerAlergia(alergia);
                  },
                );

              }).toList(),
            ),

            const Divider(height: 32),


            // --- 5. Tempo diário de treino ---

            Text(
              'Tempo diário de treino',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),

            Slider(
              value: _tempoSelecionado,
              min: 15,
              max: 120,
              divisions: 21,
              label:
                  '${_tempoSelecionado.round()} minutos',

              onChanged: (novoValor) {

                setState(() {
                  _tempoSelecionado = novoValor;
                });

                print(
                  '[DEBUG - Slider] '
                  'Tempo: ${novoValor.round()} minutos',
                );
              },
            ),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [

                const Text('15 min'),

                Text(
                  'Tempo selecionado: '
                  '${_tempoSelecionado.round()} minutos',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text('120 min'),
              ],
            ),

            const Divider(height: 32),

          ],
        ),
      ),
    );
  }
}