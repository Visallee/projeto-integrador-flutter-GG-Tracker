# 🎮 GG Tracker - Lista de Jogos Pessoal

Este é o **GG Tracker**, um aplicativo desenvolvido inteiramente em **Dart** e **Flutter**.

Este projeto foi desenvolvido como requisito de avaliação (Projeto Integrador e Atividades Pedagógicas do Eixo 1 e Eixo 2) para a disciplina de **Programação para Dispositivos Móveis**, do curso de **Bacharelado em Sistemas de Informação** do **Instituto Federal de Sergipe - Campus Lagarto**. O projeto é orientado pelo **Prof. Danilo Ferreira Neves**.

## 👨‍💻 Desenvolvedores (Programadores)

- **Victor Silva do Valle**
- **Arthur Ribeiro Lima**

## 🎯 Intenções e Proposta do Projeto

A nossa intenção com este projeto é criar um gerenciador e rastreador de biblioteca de jogos (semelhante ao MyAnimeList, mas focado em games). O aplicativo servirá como um diário pessoal onde o usuário poderá organizar sua vida gamer.

**Como a lista de jogos vai funcionar:**
O aplicativo permite ao usuário salvar seus jogos em um banco de dados local. Cada jogo cadastrado possui informações fundamentais (como Nome, Status de progressão, Conquistas e Nota). O usuário pode visualizar todos os seus jogos divididos em abas dinâmicas (Tudo, Jogando, Completos, Em Espera, Abandonado, Planejamento), adicionar novos títulos, editar informações de jogos já cadastrados e deletar jogos da sua biblioteca.

---

## ✅ Requisitos e Tecnologias

O projeto evoluiu de uma estrutura básica na memória para uma arquitetura robusta e profissional. Aqui estão as funcionalidades e tecnologias implementadas:

- **Arquitetura MVVM:** O código foi totalmente refatorado para o padrão Model-View-ViewModel, separando a regra de negócio da interface visual.
- **Banco de Dados Local (Drift):** Os dados dos jogos agora são armazenados de forma persistente e offline usando o Drift (SQLite), substituindo o antigo array em memória volátil da primeira versão.
- **Gerenciamento de Estado (Riverpod):** Utilização do Riverpod para tornar a interface reativa. As telas e as abas de categorias são atualizadas automaticamente assim que o banco de dados sofre qualquer alteração (cadastro, edição ou exclusão).
- **Listagem Dinâmica:** Utilização do widget `ListView.builder` em conjunto com `TabBarView` para renderizar os jogos separados automaticamente pelo seu status.
- **Cadastro e Validação:** Formulário completo para inserir e editar jogos, com validação para evitar dados vazios ou incorretos.
- **Notificações e Alertas:** Exibição de alertas e componentes visuais de confirmação ao manipular os dados da biblioteca.
- **Componentização Reutilizável:** Criação de componentes visuais padronizados (como cards da lista, botões de remoção e textos) integrados a um tema global de cores da aplicação.
