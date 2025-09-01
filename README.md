# Criando NFTs na Blockchain Sui

Projeto desenvolvido durante o workshop "Guia Completo: Criando um NFT na Blockchain Sui" em Pau dos Ferros - RN

## 🎯 Objetivo do workshop

Este projeto ensina como criar um NFT na blockchain Sui utilizando a linguagem Move. 

## Meu código

📌 Módulo Principal: `nft::nft_core`

### 🖼️ Estrutura que representa o NFT:
- id: Identificador único
- name: Nome do NFT
- description: Descrição
- url: Link da imagem ou mídia
- creator: Endereço do criador

### 🚀 Funções Disponíveis
- **init(otw: NFT_CORE, ctx)**

    Inicializa o projeto e cria um Publisher, que prova quem é o criador original dos NFTs.

- **mint(name, description, url, ctx)**

    Cria ("mint") um novo NFT com nome, descrição e imagem. O NFT é transferido para o endereço de quem chamou a função.

- **create_display(publisher, ctx)**

    Cria uma "vitrine" (display) com os campos visuais do NFT para que carteiras Sui possam exibir corretamente suas informações.
