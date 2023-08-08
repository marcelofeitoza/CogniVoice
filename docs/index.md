# Inteli - Instituto de Tecnologia e Liderança 

<p align="center">
<a href= "https://www.inteli.edu.br/"><img src="https://www.inteli.edu.br/wp-content/uploads/2021/08/20172028/marca_1-2.png" alt="Inteli - Instituto de Tecnologia e Liderança" border="0" width=40% height=40%></a>
</p>

<br>

# Automação com reconhecimento por voz

Nome do Projeto: Automação com reconhecimento por voz

Nome do Parceiro: IBM

Nome do Grupo: CogniVoice

Integrantes do grupo: Antonio Nassar, Bruno Meira, Luísa Silva, Marcelo Feitoza, Matheus Macedo, Pedro Baptista, Sofia Pimazzoni

**Conteúdo**

- [Visão Geral do Projeto](#visão-geral-do-projeto)
- [Entendimento do Negócio](#entendimento-do-neg%C3%B3cio-sprint-1)
- [Entendimento do Design](#entendimento-do-design-sprint-1)
- [Entendimento da Arquitetura do Sistema](#entendimento-do-design-sprint-1)
- [Documentação da Construção do Backend da Solução](#documentação-da-construção-do-backend-da-solução-sprint-3)
- [Documentação da Construção do Frontend da Solução](#documentação-da-construção-do-frontend-da-solução-sprint-4)
- [Documentação Final do Projeto](#documentação-final-do-projeto-sprint-5)
- [Referências](#referências)
- [Apêndice](#apêndice)


# Visão Geral do Projeto

## Parceiro de Negócios

Breve descrição da instituição representada pelo parceiro de negócios, porte, onde atua, área de mercado que atua e posicionamento no mercado.


## Problema

Descrever o problema ou a oportunidade de negócio.

## Objetivos

Descrever os objetivos do projeto.

## Partes Interessadas 

Descrever os principais stakeholders envolvidos no projeto e seus papéis.


# Entendimento do Negócio (Sprint 1)


## Matriz de avaliação de valor Oceano Azul

Preencher seguindo as orientações da Adalove.

### Análise da Indústria

Análise da indústria (Modelo de 5 Forças de Porter) em relação ao cenário da empresa parceira.

### Canvas Proposta de Valor

Preencher seguindo as orientações da Adalove.

### Matriz de Risco

Preencher seguindo as orientações da Adalove.

### Análise Financeira

O primeiro ponto a ser considerado é o tipo de projeto. Levando em conta o atual, não existe nenhum valor de gasto projetado pelo fato de ser um projeto interno da IBM em parceria com a faculdade Inteli. Contudo, é possível analisar o custo do projeto e quais serão as vantagens ao concluí-lo.

O custo principal do projeto é a hospedagem de toda a plataforma, sendo assim, é necessário pensar na quantidade de acessos à plataforma como uma base para o cálculo do custo. A IBM possui 17.400 funcionários no Brasil, e tendo um cenário otimista ao pensar na aceitação da plataforma, pode-se dizer que cerca de 10% dos colaboradores irão acessar a plataforma ao mesmo tempo. Com isso, é necessário utilizar instâncias com alto poder de processamento como a IBM Cloud Virtual Servers bx2-4x16.

O preço de utilização por demanda é de aproximadamente 0,2117 dólar/hora, então minimamente ao mês o gasto será de 154,61 dólares, porém caso ocorra um aumento do tráfego, a demanda por máquinas pode ser maior, consequentemente aumentando o custo.

Além disso, é necessário considerar o custo da hospedagem do banco de dados, na qual poderíamos utilizar o Database for Postgres da IBM na categoria small. O preço é de de utilização desta categoria considerando em uma perspectiva mensal seria de 470.08 dólares.

É possível estimar também o gasto com a equipe que desenvolverá toda a engenharia.

Lembrando que os valores presentes na planilha são referentes a um gasto mensal, com a possibilidade de visualização na coluna valor mensal.

OBS: Há um custo indireto relacionado a perda de talentos, tendo em vista o fato de que a cada um funcionário perdido, há um grande investimento de dinheiro e tempo gastos em tal. O qual nossa aplicação também ajuda, pois nós garantimos uma maior retenção desses.

OBS1: Deve-se ter em vista que está análise refere-se mais a uma simulação de quanto seriam os gastos a partir da utilização das especificações necessárias pensando nos serviços disponíveis na IBM Cloud, porém deve-se lembrar que o cliente é a própria IBM, dessa forma as tecnologias listadas acima são da própria empresa, e portanto, o custo irá diminuir muito, ou até mesmo zerar nesse sentido.

<img src="https://imgur.com/OY6edPT.png"/>


# Entendimento do Design (Sprint 1)

### Estudo sobre o usuário do sistema

Preencher seguindo as orientações da Adalove.

### Experiências que o usuário deverá passar ao utilizar o sistema

Preencher seguindo as orientações da Adalove.

### Proposta de UX para o sistema

Preencher seguindo as orientações da Adalove.

### Pilha de tecnologias para implementar a proposta de UX

Preencher seguindo as orientações da Adalove.

# Entendimento da Arquitetura do Sistema (Sprint 1)

Preencher seguindo as orientações da Adalove.

# Documentação do Sistema NLP (Sprint 2)

## API para implementar etapa de Speech to Text

Preencher seguindo as orientações da Adalove.

## Algoritmo de NLP utilizado e sua implementação

Preencher seguindo as orientações da Adalove.

É possível referenciar os testes da pasta tests do repositório.

## Processo de deploy do algoritmo em nuvem comercial

Preencher seguindo as orientações da Adalove.

## API para receber os áudios enviados pelo usuário

Preencher seguindo as orientações da Adalove.

É possível referenciar os testes da pasta tests do repositório.

# Documentação da Construção do Backend da Solução (Sprint 3)

## Backend preparado para receber os Webhooks de processamento de texto

## Backend preparado para receber os Webhooks de processamento de voz para texto

Preencher seguindo as orientações da Adalove.

É possível referenciar os testes da pasta tests do repositório.

## Sistema de troca de mensagens para notificar os eventos

Preencher seguindo as orientações da Adalove.

É possível referenciar os testes da pasta tests do repositório.

## Frontend mínimo para realizar o teste da implementação do modelo

Preencher seguindo as orientações da Adalove.

É possível referenciar os testes da pasta tests do repositório.

# Documentação da Construção do Frontend da Solução (Sprint 4)

## Implementação do frontend com o framework ou biblioteca desejada

Preencher seguindo as orientações da Adalove.

## Testes do frontend implementado

Preencher seguindo as orientações da Adalove.

É possível referenciar os testes da pasta tests do repositório.

## Integração do frontend com o backend implementado

Preencher seguindo as orientações da Adalove.

É possível referenciar os testes da pasta tests do repositório.

## Deploy da solução

Preencher seguindo as orientações da Adalove.


# Documentação Final do Projeto (Sprint 5)

Preencher seguindo as orientações da Adalove.

A documentação final deve conter:

- Componentes e tecnologias utilizados;
- Custo de implementação da prova de conceito e estimativa de custo para a solução final;
- Análise financeira do projeto;
- Funcionalidades implementadas na prova de conceito;
- Benefícios entregues pelo projeto;
- Aperfeiçoamentos futuros possíveis para o projeto;
- Revisão da visão geral do sistema (arquitetura da integração).

Referencie as revisões e melhorias realizadas nos itens acima.

# Referências

Toda referência citada no texto deverá constar nessa seção, utilizando o padrão de normalização da ABNT - ABNT NBR 10520). As citações devem ser confiáveis e relevantes para o trabalho. São imprescindíveis as citações dos sites de download das ferramentas utilizadas, bem como a citação de algum objeto, música, textura ou outros que não tenham sido produzidos pelo grupo, mas utilizados (mesmo no caso de licenças gratuitas, royalty free ou similares)
Sugerimos o uso do sistema autor-data para citações.


# Apêndice 

Os apêndices representam informações adicionais que não caberiam no documento exposto acima, mas que são importantes por alguma razão específica do projeto. 
