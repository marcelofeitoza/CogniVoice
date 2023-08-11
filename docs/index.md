# Inteli - Instituto de Tecnologia e Liderança

<p align="center">
<a href= "https://www.inteli.edu.br/"><img src="https://imgur.com/fQPDDtj.png" alt="Inteli - Instituto de Tecnologia e Liderança" border="0" width=100% height=40%></a>
</p>

<br>

# Automação com reconhecimento por voz

Nome do Projeto: Automação com reconhecimento por voz

Nome do Parceiro: IBM

Nome do Grupo: CogniVoice

Integrantes do grupo: 
- <a href="https://www.linkedin.com/in/antonionassar/">Antonio Nassar</a>
- <a href="https://www.linkedin.com/in/bruno-omeira/">Bruno Meira</a>
- <a href="https://www.linkedin.com/in/luísa-vitória-leite-silva-681443230/">Luísa Silva</a>
- <a href="https://www.linkedin.com/in/marcelofeitoza7/">Marcelo Feitoza</a>
- <a href="https://www.linkedin.com/in/matheusmacedosantos/">Matheus Santos</a>
- <a href="https://www.linkedin.com/in/pedro-hagge/">Pedro Baptista</a>
- <a href="https://www.linkedin.com/in/sofia-moreiras-pimazzoni/">Sofia Pimazzoni</a>

**Conteúdo**

-   [Visão Geral do Projeto](#visão-geral-do-projeto)
-   [Entendimento do Negócio](#entendimento-do-neg%C3%B3cio-sprint-1)
-   [Entendimento do Design](#entendimento-do-design-sprint-1)
-   [Entendimento da Arquitetura do Sistema](#entendimento-do-design-sprint-1)
-   [Documentação da Construção do Backend da Solução](#documentação-da-construção-do-backend-da-solução-sprint-3)
-   [Documentação da Construção do Frontend da Solução](#documentação-da-construção-do-frontend-da-solução-sprint-4)
-   [Documentação Final do Projeto](#documentação-final-do-projeto-sprint-5)
-   [Referências](#referências)
-   [Apêndice](#apêndice)

# Visão Geral do Projeto

## Parceiro de Negócios

A International Business Machines Corporation (IBM) é uma das empresas de tecnologia mais icônicas e influentes do mundo, com um histórico de mais de um século em inovação contínua. Fundada em 1911, a IBM tem sua sede em Armonk, Nova York, e estabeleceu uma presença global em mais de 170 países, empregando centenas de milhares de profissionais talentosos em todo o mundo.

A IBM atua em várias áreas do mercado de tecnologia, oferecendo uma ampla gama de produtos e serviços, como hardware, software, serviços de TI, inteligência artificial, nuvem etc.

O posicionamento da IBM no mercado é o de um provedor confiável de soluções tecnológicas para empresas e organizações em todo o mundo. Sua ênfase em pesquisa e desenvolvimento, bem como sua longa história de inovação, solidificaram sua reputação como uma empresa que impulsiona o progresso tecnológico e contribui de maneira significativa para o avanço da sociedade global.

## Problema

A busca por informações relevantes, especialmente aquelas relacionadas ao que as empresas estão discutindo sobre temas e campanhas específicas, é crucial para fornecer um contexto sólido durante reuniões, discussões com clientes e estratégias de marketing. No entanto, a natureza dinâmica dos negócios muitas vezes impede que os colaboradores tenham tempo suficiente para pesquisas extensas e aprofundadas antes desses compromissos.

Além disso, a mobilidade do time de vendas é um fator importante a ser considerado. A necessidade de acesso rápido e conveniente a informações-chave, mesmo quando em trânsito, torna fundamental uma solução que possa ser facilmente utilizada em dispositivos móveis, como smartphones. A capacidade de interagir com a solução por meio de comandos de voz adiciona uma camada adicional de conveniência e oportunidade para o negócio, permitindo que os colaboradores obtenham as informações necessárias sem distrações perigosas enquanto estão dirigindo ou em outros ambientes de deslocamento.

Em resumo, a solução proposta se concentra na oportunidade de negócio de fornecer um meio eficaz de buscar, acessar e compreender informações cruciais, ao mesmo tempo em que atende às necessidades de mobilidade e interação conveniente do time de vendas e marketing. Isso não apenas otimiza as operações internas, mas também coloca a sua empresa em uma posição mais competitiva ao oferecer uma abordagem inovadora e eficiente para lidar com o desafio de acessar e utilizar informações relevantes em um ambiente de negócios em constante mudança.

## Objetivos

O objetivo deste projeto é aprimorar integralmente o processo de pesquisa e análise dos tópicos essenciais para as campanhas e reuniões da equipe de marketing e vendas. Isso será alcançado por meio do desenvolvimento de uma aplicação portátil e intuitiva que faz uso da função de comando de voz para tornar todo o fluxo de pesquisa eficaz e eficiente.

## Partes Interessadas

De forma geral, os stakeholders representam os indivíduos, grupos ou entidades que têm interesse direto ou indireto no projeto e podem ser afetados por suas atividades, resultados e decisões. Neste projeto podemos entender como stakeholders:

- Equipe de Desenvolvimento: Responsável pela criação, desenvolvimento e implementação da solução CogniVoice - Inteli.

- Analistas de Vendas da IBM: Usuários finais da solução, utilizam a plataforma para obter insights sobre tendências de mercado e estratégias concorrentes.

- Analistas de Marketing da IBM: Assim como os Analistas de Vendas, também são os usuários finais da solução e usariam para obter insights valiosos sobre as tendências do mercado e as estratégias dos concorrentes. 

-Gestores de Vendas da IBM: Supervisionam e coordenam as atividades dos analistas de vendas, buscando o alinhamento com as metas e estratégias da empresa.


# Análise de Requisitos

## Requisitos Funcionais

| Código | Descrição do Requisito                                                                                                                                                 | Tipo      | Grupo          | Prioridade |
| ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- | -------------- | ---------- |
| RF01   | O sistema deve permitir o usuário curtir os conteúdos que têm interesse                                                                                                | Funcional | Acessibilidade | MEDIUM     |
| RF02   | A interface precisa ser dividida entre 2 usuários (time de vendas e time de marketing)                                                                                 | Funcional | Usabilidade    | HIGH       |
| RF03   | O usuário deve ter acesso a antigas pesquisas                                                                                                                          | Funcional | Acessibilidade | LOW        |
| RF04   | O sistema deve mostrar os resultados da busca na interface de acordo com o perfil do usuário                                                                           | Funcional | Usabilidade    | MEDIUM     |
| RF05   | O sistema deve apresentar possíveis respostas alternativas caso não encontre uma resposta certeira para a pergunta                                                     | Funcional | Usabilidade    | HIGH       |
| RF06   | O sistema deve compreender corretamente a pergunta do usuário e trazer uma resposta com algum fundamento                                                               | Funcional | Usabilidade    | HIGH       |
| RF07   | A aplicação deve ser projetada para funcionar em smartphones, permitindo que o time de vendas da IBM acesse facilmente as informações enquanto estiver em deslocamento | Funcional | Usabilidade    | HIGH       |
| RF08   | O sistema deve responder ao time de vendas com tendências, gráficos e títulos de manchete                                                                              | Funcional | Usabilidade    | MEDIUM     |
| RF09   | O sistema deve responder ao time de marketing com um pequeno texto sobre o que foi perguntado                                                                          | Funcional | Usabilidade    | LOW        |
| RF10   | O sistema deve informar a fonte e data das pesquisas dadas na resposta                                                                                                 | Funcional | Usabilidade    | LOW        |
| RF11   | O usuário deve poder clicar em cima de uma pesquisa e ser direcionado para ela                                                                                         | Funcional | Usabilidade    | HIGH       |
| RF12   | O sistema deve permitir a pesquisa por comando de voz                                                                                                                  | Funcional | Usabilidade    | MEDIUM     |

## Requisitos não funcionais

| Código | Descrição do Requisito                                                                                                                   | Tipo          | Grupo          | Prioridade |
| ------ | ---------------------------------------------------------------------------------------------------------------------------------------- | ------------- | -------------- | ---------- |
| RNF01  | A aplicação deve estar disponível e acessível aos usuários durante a maior parte do tempo, minimizando possíveis períodos de inatividade | Não Funcional | Acessibilidade | MEDIUM     |
| RNF02  | O sistema deve manter a privacidade dos dados dos usuários                                                                               | Não Funcional | Segurança      | HIGH       |
| RNF03  | O sistema deve ser fluido e rápido                                                                                                       | Não Funcional | Performance    | HIGH       |
| RNF04  | O sistema deve conseguir manter um fluxo de conversa com o usuário                                                                       | Não Funcional | Usabilidade    | HIGH       |
| RNF05  | O sistema deve seguir as normas da LGPD                                                                                                  | Não Funcional | Legal          | HIGH       |
| RNF06  | O sistema não deve demorar mais do que 10 segundos para processar um arquivo de áudio por completo                                       | Não Funcional | Performance    | MEDIUM     |
| RNF07  | O sistema deve rodar na nuvem                                                                                                            | Não Funcional | Implementação  | HIGH       |
| RNF08  | O sistema só deve permitir o acesso à página a usuários autenticados                                                                     | Não Funcional | Segurança      | HIGH       |
| RNF09  | O sistema deve ser escalável                                                                                                             | Não Funcional | Performance    | HIGH       |
| RNF10  | O sistema deve rodar em telefones móveis                                                                                                 | Não Funcional | Usabilidade    | HIGH       |
| RNF11  | O sistema deve ser implementado na IBM                                                                                                   | Não Funcional | Implementação  | HIGH       |

# Entendimento do Negócio (Sprint 1)

## Matriz de avaliação de valor Oceano Azul

A matriz do oceano azul é um conceito estratégico que propõe a criação de novos mercados ou espaços de atuação, em contraste com os "oceanos vermelhos", que representam mercados saturados e altamente competitivos. No oceano azul, as empresas buscam inovação, criando valor ao oferecer produtos ou serviços únicos, muitas vezes redefinindo setores inteiros e evitando a competição direta. Isso envolve a identificação de oportunidades não exploradas, a eliminação de elementos indesejados e a criação de características inovadoras, resultando em uma estratégia de diferenciação e crescimento.

- Fatores que devem ser criados:

	- Desenvolvimento de um sistema de recomendação altamente otimizado, visando a facilitar a descoberta de escolhas pertinentes e relevantes.
	- Integração fluida com diversas plataformas de análise, a exemplo do Cognos, que desempenhará o papel de uma fonte privilegiada para insights de negócios valiosos.

- Fatores que devem ser reduzidos:

	- Condição de uso: Ao contrário de outros competidores como a Alexa, que não exige presença física próxima, o CogniVoice requer que o usuário esteja com o celular em mãos para funcionar adequadamente.
	- Amplitude da base de dados: Comparativamente, os bancos de dados dos concorrentes abrangem uma maior diversidade e volume crescente de informações.

- Fatores que devem ser aumentados:

	- Excelência tecnológica e qualidade: As tecnologias empregadas no CogniVoice precisam alcançar e aumentar os níveis de alta qualidade característicos dos concorrentes, como a Alexa.
	- Personalização avançada: Capacidade de personalização voltada para empresas específicas ou tarefas de equipes particulares.

- Fatores que devem ser eliminados:

	- Estilo de conversação: O chatbot do CogniVoice adotará uma abordagem mais formal, especialmente adaptada ao ambiente corporativo, afastando-se da meta de emular a linguagem humana de maneira máxima.
	- Orientação do aplicativo e funcionalidades: O foco estará em contextos corporativos, o que se traduzirá em uma abordagem mais direcionada e menos casual do que a proposta mantida pelos concorrentes, que tendem a atender a uma variedade de ocasiões.

A seguir, apresenta-se a definição dos 8 atributos essenciais para os clientes, bem como a forma pela qual diferenciamos nossa proposta da concorrência por meio das estratégias de Redução, Eliminação, Aumento e Criação, discutidas e justificadas anteriormente. Essa descrição é acompanhada pela tabela comparativa e pelo gráfico que ilustram essa análise, considerando o projeto em desenvolvimento.

| Atributos   | CogniVoice                          | Alexa (Modelo Fisico)                  |Cortana                 |Google        |
|----------|------------------------------------------------|-----------------------|----------------------|------------------|
| Preço | 0 | 5 | 0 | 0 |
| Qualidade | 7 | 9 | 4 | 10 |
| Tecnologia | 10 | 10 | 8 | 9 |
| Conforto | 7 | 10 | 7 | 5 |
| Comodidade | 8 | 10 | 5 | 10 |
| Praticidade | 9 | 10 | 8 | 5 |
| Automação | 10 | 0 | 0 | 0 |
| Base de dados | 6 | 10 | 9 | 10 |

![Matriz de avaliação de valor Oceano Azul](https://github.com/2023M7T3-Inteli/Projeto2/assets/99202553/8863ab9b-fda3-477c-b44c-34d99ef91b3f)
<p>Figura 1: Matriz do oceano azul</p>

A seguir, apresentaremos o contexto e os elementos que situam a CognisVoice no oceano azul, com justificativas:

  - Mercado: Criação de um novo mercado que integra análise de dados e pesquisa por voz para o setor de vendas e marketing.

  - Competição: Ausência de concorrência direta devido à abordagem única de combinar busca por voz com análise aprofundada.

  - Inovador na tecnologia: Implementação inovadora de processamento de linguagem natural e análise de sentimentos para fornecer insights profundos por voz.

  - Desempenho: Desempenho excepcional com insights em tempo real e análises detalhadas por meio da combinação de busca por voz e análise profunda.
    
  - Cliente: Atendimento eficaz das necessidade de pesquisa em tempo real e análise para o time de marketing e vendas.

## Canvas Proposta de Valor

A proposta de valor de uma empresa é uma das análises mais importantes, a qual descreve os benefícios exclusivos que ela oferece aos clientes e como isso atende às suas necessidades. Ela destaca o que diferencia a empresa da concorrência e por que os clientes devem escolhê-la. A proposta de valor é extremamente importante porque ajuda a empresa a comunicar de maneira clara e direta como ela pode resolver problemas ou atender desejos específicos dos clientes.

<img src="https://imgur.com/2xTLcay.png"/>
<p align="center">Figura 2: Proposta de valor da IBM</p>

## Matriz de Risco

1. A AI não conseguir devolver uma resposta correta
2. Baixo engajamento por parte dos envolvidos no projeto
3. Complexidade do projeto não mensurada
4. Aprendizado de novas tecnologias por parte do time desenvolvedor
5. Defeitos no software podem não ser detectados até sua implementação
6. Aumento dos requisitos por parte do cliente
7. A AI pode não conseguir entender corretamente o comando recebido
8. A solução pode ser pouco utilizada, considerando a faixa etária dos funcionários
9. Adoção da solução pela empresa
10. Não conseguir concluir o MVP, considerando o tempo de desenvolvimento do projeto

<img src="https://imgur.com/ZkhwB7r.png"/>
<p align="center">Figura 3: Matriz de risco</p>

## Análise Financeira

O primeiro ponto a ser considerado é o tipo de projeto. Levando em conta o atual, não existe nenhum valor de gasto projetado pelo fato de ser um projeto interno da IBM em parceria com a faculdade Inteli. Contudo, é possível analisar o custo do projeto e quais serão as vantagens ao concluí-lo.

O custo principal do projeto é a hospedagem de toda a plataforma, sendo assim, é necessário pensar na quantidade de acessos à plataforma como uma base para o cálculo do custo. A IBM possui 17.400 funcionários no Brasil, e tendo um cenário otimista ao pensar na aceitação da plataforma, pode-se dizer que cerca de 10% dos colaboradores irão acessar a plataforma ao mesmo tempo. Com isso, é necessário utilizar instâncias com alto poder de processamento como a IBM Cloud Virtual Servers bx2-4x16.

O preço de utilização por demanda é de aproximadamente 0,2117 dólar/hora, então minimamente ao mês o gasto será de 154,61 dólares, porém caso ocorra um aumento do tráfego, a demanda por máquinas pode ser maior, consequentemente aumentando o custo.

Além disso, é necessário considerar o custo da hospedagem do banco de dados, na qual poderíamos utilizar o Database for Postgres da IBM na categoria small. O preço é de de utilização desta categoria considerando em uma perspectiva mensal seria de 470.08 dólares.

É possível estimar também o gasto com a equipe que será responsável por dar manutenção e manter toda a engenharia, nesse caso, pensamos em 4 funcionários(as) com o mesmo nível de experiência, no qual, cada um receberia 7000 reais por mês de salário, sendo nesse caso: 1 para BackEnd, 1 para FrontEnd, 1 para DBA, e 1 para Inteligência Artificial.

Lembrando que os valores presentes na planilha são referentes a um gasto mensal, com a possibilidade de visualização na coluna valor mensal.

OBS: Há um custo indireto relacionado a perda de talentos, tendo em vista o fato de que a cada um funcionário perdido, há um grande investimento de dinheiro e tempo gastos em tal. O qual nossa aplicação também ajuda, pois nós garantimos uma maior retenção desses.

OBS1: Deve-se ter em vista que está análise refere-se mais a uma simulação de quanto seriam os gastos a partir da utilização das especificações necessárias pensando nos serviços disponíveis na IBM Cloud, porém deve-se lembrar que o cliente é a própria IBM, dessa forma as tecnologias listadas acima são da própria empresa, e portanto, o custo irá diminuir muito, ou até mesmo zerar nesse sentido.

<img src="https://imgur.com/NSd9pK7.png"/>
<p align="center">Figura 4: Análise financeira para 1 mês de uso</p>

Os valores acima se referem à 1 mês de uso da aplicação. Considerando isso, os valores para 1 ano de uso estão abaixo:

<img src="https://imgur.com/ycIPiwW.png"/>
<p align="center">Figura 5: Análise financeira para 1 ano de uso</p>

# Entendimento do Design (Sprint 1)

### Estudo sobre o usuário do sistema

As personas ajudam a entender da melhor forma possível o público-alvo do sistema. Esse, é representado por uma pessoa, que possui uma biografia, motivações e dores atuais, que serão posteriormente resolvidas pela a sua solução. Considerando que o nosso público-alvo vai ser o time de vendas e de marketing da IBM, foram desenvolvidas duas personas, uma para cada time.

<img src="https://imgur.com/e6k9sfr.png"/></br>
<p align="center">Figura 6: Persona do time de marketing (Rosana)</p></br>
<img src="https://imgur.com/Ts0gilL.png"/>
<p align="center">Figura 7: Persona do time de vendas (João)</p>

### Experiências que o usuário deverá passar ao utilizar o sistema

A jornada do usuário, fundamentada na persona, é um conceito chave no design de experiência do usuário (UX) que mapeia a trajetória completa que um indivíduo percorre ao interagir com um produto, serviço ou plataforma. Ela começa com a descoberta inicial e vai até a fidelização do usuário. Além disso, a jornada do usuário desempenha é muito importante pois ajuda a alinhar as metas do negócio com as expectativas e desejos dos usuários, resultando em um maior engajamento, fidelidade e sucesso geral.

<img src="https://imgur.com/7iipSk5.png"/></br>
<p align="center">Figura 8: Jornada do usuário da persona de marketing (Rosana)</p></br>
<img src="https://imgur.com/wyFta8O.png"/>
<p align="center">Figura 9: Jornada do usuário da persona de vendas (João)</p>

### Proposta de UX para o sistema

Ao desenvolver a interface CogniVoice, foi utilizado o Design System da área de Cloud da IBM, que possui o preto, branco e um azul mais escuro como cores principais. Essas cores são favoráveis à visão do usuário, uma vez que o preto como cor de fundo não machuca os olhos, principalmente em ambientes escuros. Já o branco, foi usado para os textos principais, já que produz um contraste muito forte e saudável com o preto. Por último, o azul escuro, que é uma cor que possui contraste com amabas anteriores, foi usado principalmente em botões, para que eles pudessem ficar mais visíveis e ganhar destaque no olhar do usuário. Além disso, considerando que a solução possui dois públicos-alvo diferentes, o time de vendas e o de marketing, logo que o usuário faz o login, ele tem a opção de escolher a opção de resposta que mais lhe agrada, dependendo de qual área ele atua, e sendo possível mudar a escolha posteriormente caso seja necessário. Depois de fazer essa escolha, o usuário é direcionado para a página principal, a qual ele possui acesso a tendências do momento, pesquisas passadas, ou a um chat novo. Caso ele decida por iniciar um novo chat, ele clica no botão e ainda tem a opção tanto de falar, como de escrever o prompt. Essas duas formas de pesquisa deixam o usuário mais satisfeito ao utilizar a plataforma, pois nem sempre ele vai querer falar, e ter uma opção para escrever, e ainda assim usufruir dos benefícios da aplicação, o deixa muito contente.

link de acesso ao mockup da aplicação: https://www.figma.com/file/FirLgWCt3rcQyOOdxIaGZE/Untitled?type=design&node-id=0%3A1&mode=design&t=sDIaIwqvc109ecsE-1

### Pilha de tecnologias para implementar a proposta de UX

Para implementar a proposta de UX, é necessário selecionar uma pilha de tecnologias apropriada. Os elementos a serem considerados incluem a plataforma em que o sistema será executado, linguagens de programação, frameworks, bibliotecas relevantes, e integrações com outros sistemas ou serviços. É importante escolher tecnologias confiáveis, escaláveis e que permitam a criação da UX conforme projetada, garantindo uma implementação eficiente e de qualidade.

Considerando isso, foi decidido por fazer um sistema mobile, para facilitar a usabilidade, utilizando as seguintes tecnologias para desenvolvimento: 

| Tecnologia  | Descrição                                                    | Referência                                   |
| ----------- | ------------------------------------------------------------ | -------------------------------------------- |
| Flutter     | Framework para desenvolvimento de aplicações multiplataforma | [https://flutter.dev/](https://flutter.dev/) |
| Dart        | Linguagem de programação utilizada pelo Flutter              | [https://dart.dev/](https://dart.dev/)       |
| Material UI | Biblioteca de componentes para o Flutter                     | [https://material.io/](https://material.io/) |

Ao empregar essa pilha de tecnologias, estaremos equipados para criar uma experiência de usuário envolvente. A análise detalhada do público-alvo do sistema e a implementação cuidadosa dessas tecnologias permitirão a realização dos objetivos de UX de maneira eficiente e impactante.

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

-   Componentes e tecnologias utilizados;
-   Custo de implementação da prova de conceito e estimativa de custo para a solução final;
-   Análise financeira do projeto;
-   Funcionalidades implementadas na prova de conceito;
-   Benefícios entregues pelo projeto;
-   Aperfeiçoamentos futuros possíveis para o projeto;
-   Revisão da visão geral do sistema (arquitetura da integração).

Referencie as revisões e melhorias realizadas nos itens acima.

# Referências

Toda referência citada no texto deverá constar nessa seção, utilizando o padrão de normalização da ABNT - ABNT NBR 10520). As citações devem ser confiáveis e relevantes para o trabalho. São imprescindíveis as citações dos sites de download das ferramentas utilizadas, bem como a citação de algum objeto, música, textura ou outros que não tenham sido produzidos pelo grupo, mas utilizados (mesmo no caso de licenças gratuitas, royalty free ou similares)
Sugerimos o uso do sistema autor-data para citações.

# Apêndice

Os apêndices representam informações adicionais que não caberiam no documento exposto acima, mas que são importantes por alguma razão específica do projeto.
