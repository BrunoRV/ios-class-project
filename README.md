# posts-api-ios

Seu desafio será desenvovler um app que liste posts de usuários e que detalhe os comentários do post selecionado. 

## OBJETIVOS
Exibir listagem de posts de usuários consumindo a API "https://jsonplaceholder.typicode.com/posts".
Exibir detalhes de comentários do post selecionado pelo usuário.<br/>
Caminho da api para comentários: "https://jsonplaceholder.typicode.com/posts/{post_id}/comments"

## OBRIGATORIEDADES:
Boas práticas com padrões em desenvolvimento de software.<br/>
Conhecimento em consumo de APIs (REST) - Alamofire (preferencial) ou semelhante.<br/>
Arquitetura - MVP (preferencial) ou semelhante.<br/>
Utilizar Swift language.<br/>
Utilizar Cocoapods.<br/>
Seguir como exemplos de UI e conteúdo no diretório /class project.<br/>
<br/><br/>
<p align="left">
  <img src="class project/ui_posts_example.png?raw=true" width="350" title="Posts">
</p>
<br/><br/>
<p align="left">
  <img src="class project/ui_comments_example.png?raw=true" width="350" title="Posts">
</p>

---

# Minha versão

## Instruções para rodar o projeto

Versão de deploy: `iOS 14.0`

1. Clonar o repositório utilizando o comando

`git clone <caminho para este repositório>`

2. Abrir um terminal e ir para a pasta onde o projeto foi clonado

3. Rodar o comando

`pod install`

para instalar as dependências do projeto

4. Abrir o arquivo `RogaLabsTechCase.xcworkspace`

5. Selecionar um simulador ou dispositivo rodando (pelo menos) a versão indicada acima

6. Rodar o aplicativo

## Conformidade aos requisitos

* Implementação de duas views: post e comment, consumindo a API pelas respectivas rotas.

* Consumo da API utilizando Alamofire.

* Utilização de arquitetura baseada em MVVM.

* Projeto feito em Swift.

* Cocoapods usado para gerenciamento de dependências.

* UI similar às apresentadas nos exemplos com pequenas adaptações.

* Boas práticas: suporte a localização (inglês e português) e código padronizado.

## Particularidades

A título de experimentação, fiz a interface utilizando SwiftUI.
