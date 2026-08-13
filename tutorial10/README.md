# tutorial10
# Diário de Memórias

O projeto é um aplicativo feito em Flutter para selecionar fotos da galeria e mostrar as imagens organizadas na tela. Também é possível clicar em uma foto para abrir em tamanho maior e usar zoom.

## Arquivos principais:

*main.dart: inicia o aplicativo e configura o Provider e a tela principal.

*memory_item.dart: representa cada memória, guardando o id, o caminho da imagem e a data.

*memory_provider.dart: controla as memórias e usa o 'image_picker' para selecionar as fotos da galeria.

*home_screen.dart: mostra as fotos em uma grade e possui o botão para adicionar novas imagens.

*detail_screen.dart: mostra a foto selecionada em tamanho maior e permite dar zoom.

## Como as imagens são carregadas

Quando o usuário clica em 'Adicionar Fotos', o aplicativo usa o 'image_picker' através do método 'pickMultiImage()'. Assim, é possível escolher várias fotos da galeria.

Depois disso, o caminho das imagens é guardado em cada 'MemoryItem' e as fotos são mostradas na tela principal.

Eu fiz uma pequena modificação no código original para conseguir testar o aplicativo pelo Chrome, já que não consegui utilizar o AVD no computador da sala. Para isso, adaptei a forma de exibição das imagens para funcionar também na Web, usando 'Image.network' quando o aplicativo está rodando no navegador e 'Image.file' no   Android.

## Funcionamento

O fluxo básico é:
Adicionar Fotos; escolher imagens; imagens são adicionadas à lista; aparecem na 'grade'; clicar na foto; abrir detalhes e usar zoom.
O aplicativo utiliza o Provider para atualizar a tela automaticamente quando novas imagens são adicionadas.
