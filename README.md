# 🎮 GG Tracker - Lista de Jogos Pessoal

Este é o **GG Tracker**, um aplicativo desenvolvido inteiramente em **Dart** e **Flutter**.

Este projeto foi desenvolvido como requisito de avaliação (Projeto Integrador e Atividade Pedagógica do Eixo 1) para a disciplina de **Programação para Dispositivos Móveis**, do curso de **Bacharelado em Sistemas de Informação** do **Instituto Federal de Sergipe - Campus Lagarto**. O projeto é orientado pelo **Prof. Danilo Ferreira Neves**.

## 👨‍💻 Desenvolvedores (Programadores)

- **Victor Silva**   - **Arthur Ribeiro**

## 🎯 Intenções e Proposta do Projeto

A nossa intenção com este projeto é criar um gerenciador e rastreador de biblioteca de jogos (semelhante ao MyAnimeList, mas focado em games). O aplicativo servirá como um diário pessoal onde o usuário poderá organizar sua vida gamer.

**Como a lista de jogos vai funcionar:**
O aplicativo permitirá ao usuário salvar seus jogos em uma lista na memória. Cada jogo cadastrado terá informações fundamentais (como Nome, Categoria, Status de progressão e Nota). O usuário poderá visualizar todos os seus jogos em uma lista dinâmica na tela principal, adicionar novos títulos, editar informações de jogos já cadastrados e deletar jogos da sua biblioteca.

---

## ✅ Requisitos Obrigatórios e Técnicos

Para atender a todas as exigências acadêmicas propostas nas atividades do Eixo 1, este aplicativo documenta e implementa as seguintes funcionalidades técnicas:

- **Armazenamento em Array:** Os dados dos jogos serão manipulados e armazenados localmente em uma estrutura de lista/array.
- **Listagem Dinâmica:** Utilização obrigatória do widget `ListView.builder` para renderizar a tela principal com os jogos cadastrados.
- **Cadastro e Validação:** Uma tela específica com um formulário para inserir novos jogos, incluindo validação de campos para evitar dados vazios.
- **Edição e Remoção:** Funcionalidade para editar os dados ao clicar em um item da lista e remoção de itens.
- **Notificações e Alertas:** \* Exibição de um alerta de confirmação (`AlertDialog`) exigindo que o usuário confirme antes de excluir um jogo.
  - Exibição de uma notificação de sucesso (`SnackBar`) após o cadastro de um novo jogo.
- **Gerenciamento de Estado:** Manipulação de estado na tela (como o uso de `setState`) para atualizar um contador em tempo real mostrando o total de jogos salvos na biblioteca.
- **Componentização Reutilizável:** Criação de componentes visuais padronizados e reutilizáveis para manter o código limpo, incluindo:
  - Componente para os itens (cards) da lista.
  - Componente de ícone/botão de remoção seguindo a paleta de cores.
  - Componente de texto para padronizar cor e tamanho das fontes no app.
