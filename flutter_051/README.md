# flutter_051

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Novo Evento Social ---- Mayra 2DS
Aplicativo desenvolvido em Flutter para cadastro e configuração de eventos sociais

## Resumo do Desenvolvimento

### 1 - Qual o nome do componente Slider e sua variável padrão?
O componente é `Slider` e a variável responsável por armazenar o valor padrão é `_convidadosPadrao`

### 2 - Qual a diferença entre OutlinedButton e ElevatedButton?
O `OutlinedButton` possui apenas uma borda e o fundo geralmente fica transparente. Já o `ElevatedButton` possui fundo preenchido e um efeito de elevação.
Eles possuem parâmetros em comum, como `onPressed` e `child`, mas também podem ter parâmetros de estilo diferentes. O `OutlinedButton` trabalha com a borda (`side`), enquanto o `ElevatedButton` pode trabalhar com a elevação e o estilo do botão.

### 3 - Para que serve o setState() no RadioGroup?
O `setState()` serve para atualizar a opção selecionada na tela. Quando o usuário escolhe uma opção diferente, ele faz o Flutter reconstruir a parte da tela para mostrar a nova seleção.

### 4 - O que faz o .map na lista de itens do Dropdown?
O `.map` passa por cada item da lista e transforma cada um em uma opção do Dropdown. É como pegar cada item da lista e criar uma opção para aparecer no menu.

### 5 - Como as tags do FilterChip são controladas?
A lista `_tagsSelecionadas` guarda as tags escolhidas pelo usuário. Quando uma tag é selecionada, ela é adicionada com `.add()`. Quando é desmarcada, ela é retirada com `.remove()`. O `setState()` atualiza a tela para mostrar a mudança.