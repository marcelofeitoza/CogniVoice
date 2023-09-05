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
<p align="center">Figura 1: Matriz do oceano azul</p>

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

<p align="center">
	<img width="80%" src="https://imgur.com/NSd9pK7.png"/>
</p>
<p align="center">Figura 4: Análise financeira para 1 mês de uso</p></br></br>

Os valores acima se referem à 1 mês de uso da aplicação. Considerando isso, os valores para 1 ano de uso estão abaixo:

<p align="center">
	<img width="80%" src="https://imgur.com/ycIPiwW.png"/>
</p>
<p align="center">Figura 5: Análise financeira para 1 ano de uso</p>

# Entendimento do Design (Sprint 1)

### Estudo sobre o usuário do sistema

As personas ajudam a entender da melhor forma possível o público-alvo do sistema. Esse, é representado por uma pessoa, que possui uma biografia, motivações e dores atuais, que serão posteriormente resolvidas pela a sua solução. Considerando que o nosso público-alvo vai ser o time de vendas e de marketing da IBM, foram desenvolvidas duas personas, uma para cada time.

<p align="center">
	<img width="70%" src="https://imgur.com/e6k9sfr.png"/></br>
</p>
<p align="center">Figura 6: Persona do time de marketing (Rosana)</p></br></br>

<p align="center">
	<img width="70%" align="center" src="https://imgur.com/Ts0gilL.png"/>
</p>
<p align="center">Figura 7: Persona do time de vendas (João)</p>

### Experiências que o usuário deverá passar ao utilizar o sistema

A jornada do usuário, fundamentada na persona, é um conceito chave no design de experiência do usuário (UX) que mapeia a trajetória completa que um indivíduo percorre ao interagir com um produto, serviço ou plataforma. Ela começa com a descoberta inicial e vai até a fidelização do usuário. Além disso, a jornada do usuário desempenha é muito importante pois ajuda a alinhar as metas do negócio com as expectativas e desejos dos usuários, resultando em um maior engajamento, fidelidade e sucesso geral.

<p align="center">
	<img width="70%" src="https://imgur.com/7iipSk5.png"/></br>
</p>
<p align="center">Figura 8: Jornada do usuário da persona de marketing (Rosana)</p></br></br>

<p align="center">
	<img width="70%" align="center" src="https://imgur.com/wyFta8O.png"/>
</p>
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

## Versão 1 da arquitetura do sistema

<p align="center">
	<img width="60%" src="https://imgur.com/4dy6TAS.png"/>
</p>
<p align="center">Figura 10: Versão 1 da arquitetura do sistema</p>

# Documentação do Sistema NLP (Sprint 2)

## API para implementar etapa de Speech to Text

Para capturar as gravações de áudio dos usuários e realizar transcrições precisas em texto, optamos por integrar a API de Conversão de Fala em Texto (Speech-to-Text) fornecida pelo serviço IBM Watson. O IBM Watson® Speech to Text possibilita a transformação de áudio em texto, viabilizando a incorporação de funcionalidades de transcrição de voz em nossos aplicativos.

Neste guia, destacamos os principais recursos do Speech-to-Text que foram empregados no projeto, acompanhados por exemplos práticos. Apresentaremos o propósito da biblioteca, seu funcionamento e a maneira como a aplicamos para atingir nossos objetivos.

O presente documento cobre a versão 1 do Speech-to-Text. Os exemplos presentes nesta documentação foram elaborados para a plataforma Node.js, utilizando a versão 4.18.2 do framework Express.

### Parte 1: Criação da variável de ambiente

Para fazer uso da API de Conversão de Fala em Texto (Speech-to-Text), é imprescindível a utilização da URL e chave do serviço fornecidos. Por questões de segurança, esses dados sensíveis são armazenados em uma variável de ambiente, destinada a ser empregada nos trechos de código. A seguir, apresentamos um exemplo de configuração do arquivo .env:

```env
	API_KEY_SPEECH_TO_TEXT="key-speech-to-text"
	SERVICE_URL_SPEECH_TO_TEXT="url-speech-to-text"
```



### Parte 2: Importação

Para importar a api do speech-to-text, execute em seu código:

```js
	const SpeechToTextV1 = require("ibm-watson/speech-to-text/v1");
	const { IamAuthenticator } = require("ibm-watson/auth"); (código)
```

Os códigos acima são específicos para a versão 1 da API de Speech-to-Text e abordam o processo de autenticação necessária junto ao IBM Watson, requisito fundamental para a utilização plena da API.

### Parte 3: Criação de uma Instância do Serviço de Conversão de Fala para Texto

A criação da instância do serviço encapsula todas as configurações necessárias para interagir com a API de conversão de fala para texto. Isso ajuda a manter o código organizado, modular e mais fácil de entender, além de facilitar futuras atualizações ou mudanças nas configurações do serviço.

```js
	const speechToText = new SpeechToTextV1({
    		authenticator: new IamAuthenticator({
        		apikey: process.env.API_KEY_SPEECH_TO_TEXT,
		}),
		serviceUrl: process.env.SERVICE_URL_SPEECH_TO_TEXT,
	});
```

O código cria uma instância de um serviço de conversão de fala para texto utilizando a biblioteca do IBM Watson fornecido. Ele se autentica usando uma chave de API e uma URL de serviço que são lidas de variáveis de ambiente. Essa instância do serviço pode então ser usada para fazer chamadas à API de conversão de fala para texto fornecida pela IBM Watson.

### Parte 4: Criação da função

Aqui criaremos função chamada generateText que utiliza a API de Reconhecimento de Fala para Texto para converter um bloco de áudio em texto. Segue abaixo o código e a explicação de cada parte do código:

```js
	async function generateText(audio) {
		try {
			const result = await speechToText.recognize({
				audio: audio,
				contentType: "audio/flac",
				model: "pt-BR_BroadbandModel",
				keywords: ["oi"],
				keywordsThreshold: 0.5,
				maxAlternatives: 3,
			});
			return result.result.results[0].alternatives[0].transcript;
		} catch (error) {
			throw Error("Error recognizing audio");
		}
	}
```

A função generateText é definida como assíncrona e recebe um único parâmetro chamado audio, que é o áudio que será processado para reconhecimento de fala.

O bloco try-catch envolve o código da função, o que significa que ele está preparado para capturar erros que possam ocorrer durante a execução do código dentro do bloco try.

A função speechToText.recognize() é chamada com um conjunto de parâmetros para realizar o reconhecimento de fala:

  - audio: audio: O bloco de áudio é passado como o parâmetro de áudio para a chamada da API.
  - contentType: "audio/flac": Especifica o tipo de conteúdo do áudio (formato FLAC).
  - model: "pt-BR_BroadbandModel": Indica o modelo de linguagem a ser usado para o reconhecimento (no caso, para o português do Brasil).
  - keywords: ["oi"]: Define palavras-chave que o sistema deve procurar no áudio.
  - keywordsThreshold: 0.5: Define o limite de confiança para reconhecimento das palavras-chave.
  - maxAlternatives: 3: Especifica o número máximo de alternativas de reconhecimento que a API deve retornar.

Se a chamada à API for bem-sucedida e não houver erros, a função retorna o texto reconhecido da resposta da API. Se ocorrer um erro durante a chamada à API, o bloco catch será executado e a função lança um erro com a mensagem "Error recognizing audio".

### Parte 5: Criação do endpoint

E por ultimo, criaremos o endpoint que irá utilizar da função que processa o reconhecimento de fala. Esse código define uma rota POST para receber dados de áudio, processá-los usando a função generateText explicada anteriormente, e retornar uma resposta JSON contendo o texto reconhecido e uma representação em base64 dos dados de áudio. O detalhaento  do código se apresenta abaixo do mesmo:

```js
	app.post("/text", async (req, res) => {
		try {
			const text = await generateText(req.body);
			console.log(text);

			res.status(200).json({
				message: text,
				audio: req.body.toString("base64"),
			});
		} catch (error) {
			res.status(500).json({
				message: error.message,
				audio: req.body.toString("base64"),
			});
		}
	});
```

  - POST /text: Isso significa que essa rota estará disponível para receber solicitações POST no caminho /text.
  - Função Assíncrona: A rota é definida como uma função assíncrona, o que significa que contem operações assíncronas que esperam por respostas, como chamadas de API.
  - Bloco Try-Catch: Assim como no exemplo anterior, a rota envolve todo o seu código em um bloco try-catch, permitindo capturar e lidar com erros que podem ocorrer durante a execução do código dentro do bloco try.
  - A função generateText é chamada com os dados do corpo da solicitação POST (req.body).
  - O resultado do reconhecimento de fala (texto reconhecido) é armazenado na variável text.
  - Console Log: O texto reconhecido (text) é exibido no console usando console.log.

Se o processamento for bem-sucedido (ou seja, nenhum erro é lançado dentro do bloco try), a resposta é montada com status HTTP 200 OK e a resposta vai conter uma mensagem com o texto reconhecido (message: text) e uma representação em base64 dos dados de áudio originalmente enviados na solicitação (audio: req.body.toString("base64")). Em caso de erro a rota capturará o erro no bloco catch e a resposta é montada com status HTTP 500 Internal Server Error contendo uma mensagem de erro (message: error.message) que é derivada do erro capturado e uma representação em base64 dos dados de áudio originalmente enviados na solicitação (audio: req.body.toString("base64")).

### Parte 6: Considerações finais

Esta documentação se concentra exclusivamente na integração da API em nossa aplicação. Se surgirem questionamentos sobre o funcionamento interno da API de Conversão de Fala em Texto (Speech-to-Text) ou a necessidade de informações detalhadas sobre funcionalidades adicionais e parâmetros específicos do IBM Watson, recomendamos acessar a documentação oficial da API de Conversão de Fala em Texto por meio do seguinte link: [Speech to Text Docs](https://cloud.ibm.com/apidocs/speech-to-text)


## Algoritmo de NLP utilizado e sua implementação

### 1.0 Instalação

O primeiro ponto que devemos analisar é o conjunto de dados, que consiste basicamente em uma tabela com uma coluna e vinte linhas contendo links para reportagens que mencionam a IBM. Essas matérias foram selecionadas pelo grupo.

As primeiras células do notebook consistem nas importações das bibliotecas, como o pandas e o numpy (as principais e praticamente presentes em todos os notebooks). Posteriormente, temos a importação da biblioteca "spaCy", uma ferramenta utilizada principalmente para o Processamento de Linguagem Natural (PLN). Ela é empregada em tarefas como análise de sentimento, extração de informações, resumo automático de textos, chatbots, tradução automática, entre outras.

Logo após, temos estes trechos de código:

1- Importa a biblioteca NLTK e faz o download do pacote de recursos chamado 'punkt'. Este pacote contém modelos treinados para a tokenização de palavras e sentenças.
```env
	import nltk
	nltk.download('punkt')
```
2- Módulos do NLTK para a tokenização e importação da biblioteca "re" para trabalhar com expressões regulares, as quais são úteis para realizar manipulações em texto.
```env
	from nltk.tokenize import word_tokenize
	from nltk.tokenize import sent_tokenize
	import re
```
3- Importação do lematizador WordNetLemmatizer do NLTK, que transforma as palavras em sua forma básica. Por exemplo, a palavra "corredor" é transformada em "correr".
```env
	from nltk.stem import WordNetLemmatizer
```
4- Realizando o download dos recursos para o stemmer RSLP (Removedor de Sufixos da Língua Portuguesa). O stemmer é utilizado para reduzir palavras à sua forma raiz (stem) ao remover os sufixos. Por exemplo, se temos a palavra "executar", ele a transforma em "execut". Posteriormente, criamos uma instância para ser utilizada durante o código.
```env
	nltk.download('rslp')

	stemmer = nltk.stem.RSLPStemmer()
```
5 - A importação do pacote de português do NLP.
```env
	nlp = spacy.cli.download('pt_core_news_sm')
	nlp = spacy.load('pt_core_news_sm')
```
6- Como nosso conjunto de dados é composto por URLs, importamos a biblioteca "requests", que permite enviar solicitações HTTP e obter o conteúdo de uma URL. Em seguida, importamos as bibliotecas "urllib.request" e "urlopen", que estão relacionadas à manipulação de URLs.
```env
	import requests

	import urllib.request
	from urllib.request import urlopen
```
7- A Beautiful Soup é utilizada para realizar o parsing (análise) de documentos HTML e XML. Ela possibilita a extração de informações específicas de uma página web.
```env
	from bs4 import BeautifulSoup
```
8- Essa linha importa a classe "Tokenizer" da biblioteca Keras. O Keras é um framework popular para a construção e treinamento de modelos de aprendizado profundo (deep learning). O Tokenizer é empregado para transformar texto em uma representação numérica apropriada para o treinamento de modelos de processamento de linguagem natural.
```env
	from keras.preprocessing.text import Tokenizer
```
Por último, importamos a classe "drive" do módulo "google.colab" e montamos o Google Drive no ambiente do Google Colab.

### 2.0 Importação e Compreensão do Dados

Na seção 2.0, "Importação e Compreensão dos Dados", temos apenas a importação do conjunto de dados localizado no drive compartilhado e a visualização da tabela.

### 3.0 Tratamento dos dados

Na seção 3.0, "Tratamento dos Dados", temos o seguinte código:
```env
	dados_dataframe = [
    "Esta é a primeira frase.",
    "Aqui vem a segunda frase com palavras de parada.",
    "E a terceira frase.",
    "Quarta frase é necessário o uso de acentos e pontuações",
    "Teste para pontuação (virgulas, `""´ e dois pontos:)",
    "Exemplo de titulo 1  - Inforchannel",
    "Exemplo de titulo 2 | Voxel",
    "Exemplo de titulo 3 Por Investing.com",
    "  Isso  é um   exemplo   ",
    "  Espaços   múltiplos     ",
    "oi, tudo 3 bem 4 com voce?",
    "isso 76 apresenta 12 número isolados"
]

test_dataframe = pd.DataFrame(dados_dataframe)


maisculas_test = [
    ["OI", "TESTE", "maisculas", "Funcionando", "KKKKKKK", "Risadas"]
]

maisculas_dataframe = pd.DataFrame(maisculas_test)


test_dataframe
```
Ele cria essencialmente dois DataFrames ("test_dataframe" e "maisculas_dataframe") para representar dados de texto em formato tabular. O primeiro DataFrame contém frases e sentenças, enquanto o segundo DataFrame contém palavras em maiúsculas em uma lista aninhada. Esses dataframes serão usados para testes.

Em seguida, ocorre o tratamento desses dados, que envolve a remoção de acentos. Isso é feito porque o processamento de linguagem natural (NLP) envolve comparações de palavras e textos, e isso ajuda a garantir que palavras com e sem acentos sejam consideradas equivalentes. Além disso, há a transformação das letras maiúsculas para minúsculas, pois é preferível trabalhar com texto em minúsculas para que as análises não sejam afetadas pelas variações de caixa.

Na seção 3.2.2, na qual é testada a função, podemos observar que os dataframes "test_dataframe" e "maisculas_dataframe" foram completamente modificados, sem acentos e em letras minúsculas.

A partir da seção 3.3, "Tratamento do Veículo da Notícia", uma série de métodos continua a tratar o texto para NLP. A primeira função é chamada "clean_title" e tenta extrair a parte do título que vem antes de certos separadores, como hífen, barra vertical ou a palavra "por". A segunda função, "remove_marks", substitui todos os caracteres especiais por uma string vazia. A terceira função remove as aspas, enquanto a quarta exclui espaços duplicados. Após isso, ocorre a remoção de números isolados por um espaço em branco. Finalmente, na seção 3.8, é apresentado o "test_dataframe" após passar por todas essas modificações.

### 4.0 Web Scraping

Na seção 4, há duas funções. A primeira tem como objetivo extrair o título de uma página da web a partir da URL fornecida como entrada. A função utiliza a biblioteca urllib para fazer uma requisição HTTP à página web e a biblioteca BeautifulSoup para analisar o conteúdo HTML da página e extrair o título dela. A segunda função remove as tags de style, script e title pois não contém nenhuma informação útil para o programa, e tmabém é removida todas as informações antes do título por conta de serem desnecessarias.  Ao final, podemos ver um conjunto de dados com mais duas colunas resultantes dessas duas funções.

### 5.0 Extração dos dados

Na seção 5, são adicionadas mais quatro colunas. A primeira delas se chama "data". A função "extract_dates" utiliza expressões regulares para realizar esse trabalho e retorna a primeira data correspondente encontrada ou "None" se nenhuma data for encontrada. A segunda coluna é "fonte", relacionada à função "extrair_dominio", que utiliza expressões regulares para encontrar o domínio em uma URL que começa com "https://", retornando o domínio se encontrado ou "None" se não houver correspondências. As outras duas colunas são nomes de empresas e pessoas retiradas do texto, função essa que usa a técnica identificação de entidades de NLP .

### 6.0 Aplicação das tecnicas de PLN

Na seção 6, as técnicas de NLP também são usadas:

1. **Stop Words**: remove palavras de parada (stop words) de um texto ou de uma lista de textos.
2. **Lematização**: tem como objetivo lematizar um texto ou uma lista de textos usando o modelo do spaCy que foi importado no início do notebook.
3. **Tokenização**: divide o texto em palavras individuais (tokens) e retorna esses tokens em uma lista.

### 7.0 Pipeline de pré processamento

Na seção 7, são realizados todos os testes elaborados, mas com uma nova pipeline de dados. Pipeline essa que tem dentro todos os outros testes desenvolvidos durante o notebook. 

### 8.0 Bag of Words

Por fim, na seção 8, é utilizado o conceito de Bag of Words, que é uma maneira de representar documentos de texto como vetores numéricos, onde cada posição no vetor representa uma palavra e o valor indica a frequência dessa palavra no documento. Ao final, é apresentado o resultado com as palavras repetidas.



## Processo de deploy do algoritmo em nuvem comercial

### Tutorial: Configurando uma Instância EC2 na AWS e Hospedando um Backend em JavaScript

Neste tutorial, vamos configurar uma instância EC2 na AWS e hospedar um backend desenvolvido em JavaScript.

#### Parte 1: Criando uma Instância EC2 na AWS

1. **Acesse o Console da AWS:**
   Faça login na sua conta da AWS em [https://aws.amazon.com/](https://aws.amazon.com/) e acesse o Console de Gerenciamento da AWS.

2. **Navegue até o serviço EC2:**
   No painel de controle da AWS, procure e clique no serviço "EC2" (Elastic Compute Cloud).

3. **Crie uma nova instância:**
   - Clique em "Launch Instances" para iniciar o assistente de criação de instâncias.
   - Escolha uma Amazon Machine Image (AMI) que atenda às suas necessidades (por exemplo, uma AMI com sistema operacional Linux).
   - Selecione o tipo de instância "t3.micro" para fins de teste.
   - Configure outras opções, como rede e segurança.
   - Clique em "Review and Launch" após configurar tudo.

4. **Configure regras de segurança:**
   - Crie ou selecione o Security Group "SG-Grupo2".
   - Adicione as seguintes regras de entrada:
     - SSH: Origem 0.0.0.0/0
     - HTTP: Origem 0.0.0.0/0
     - Custom TCP Rule: Porta 3001, Origem 0.0.0.0/0

5. **Configure a chave SSH:**
   - Escolha a chave SSH ".pem" que você criou para "KP-GRUPO2".

6. **Revise e inicie a instância:**
   - Verifique as configurações e clique em "Launch".
   - Escolha um par de chaves existente ou crie um novo para acessar a instância via SSH.

7. **Acesso à instância:**
   - Anote o IP público da instância.
   - Conecte-se via SSH usando o seguinte comando:
     ```
     ssh -i /caminho/para/sua/chave.pem ec2-user@seu_ip_publico
     ```

#### Parte 2: Hospedando um Backend em JavaScript

1. **Instale o NVM e o Node.js:**
   - Instale o NVM:
     ```
     curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
     ```
   - Atualize a sessão do terminal ou execute o seguinte comando:
     ```
     source ~/.bashrc
     ```
   - Instale uma versão específica do Node.js (por exemplo a LTS):
     ```
     nvm install lts
     ```
   - Defina a versão instalada como padrão:
     ```
     nvm use lts
     ```

2. **Clone o código:**
   - Clone o repositório Git com o código do backend:
     ```
     git clone https://github.com/2023M7T3-Inteli/Projeto2.git
     ```

3. **Instale dependências e inicie o backend:**
   - Navegue até a pasta do projeto:
     ```
     cd Projeto2
     ```
   - Instale as dependências:
     ```
     npm install
     ```
   - Inicie o backend com o script "start":
     ```
     npm start
     ```

4. **Acesso ao backend:**
   - O backend estará acessível através do IP público da instância e a porta configurada (por exemplo, http://seu_ip_publico:3001).


### Tutorial: Como criar um banco de dados RDS na AWS - PostgreSQL

Neste tutorial, você aprenderá como criar um banco de dados Amazon RDS com a configuração específica fornecida: nome "GRUPO2_DB", tipo "PostgreSQL", usando a camada gratuita e associando um grupo de segurança chamado "SG_DB".

#### Parte 1: Criação do Banco de Dados RDS

**Passo 1: Acesso ao Console da AWS:**
1. Faça login na sua conta da AWS em [https://aws.amazon.com/](https://aws.amazon.com/) e acesse o Console de Gerenciamento da AWS.

**Passo 2: Navegação para o Amazon RDS:**
1. No painel de controle da AWS, procure e clique no serviço "RDS" (Amazon Relational Database Service).

**Passo 3: Criação de um Banco de Dados:**
1. Clique no botão "Create database" para iniciar o processo de criação.

**Passo 4: Seleção do mecanismo de banco de dados:**
1. Escolha o mecanismo de banco de dados "PostgreSQL".

**Passo 5: Configurações de Templates de Banco de Dados:**
1. Selecione a opção "Free tier" para garantir que você está usando a camada gratuita.

**Passo 6: Configuração do Banco de Dados:**
1. Preencha as seguintes informações:
   - **DB instance identifier:** GRUPO2_DB
   - **Master username:** Escolha um nome de usuário para o administrador do banco de dados.
   - **Master password:** Escolha uma senha segura para o administrador do banco de dados.

**Passo 7: Configurações de Instância:**
1. Escolha o tipo de instância adequado às suas necessidades. Lembre-se de que você está usando a camada gratuita.

**Passo 8: Configurações de Acesso:**
1. Deixe as configurações padrão ou ajuste conforme necessário.

**Passo 9: Configurações de Avançado:**
1. Expanda a seção "Database options".
2. Escolha o nome do banco de dados, por exemplo, "grupo2db".

**Passo 10: Configurações de VPC, Subnet e Grupos de Segurança:**
1. Escolha o Virtual Private Cloud (VPC) desejado.
2. Selecione a Subnet.
3. Escolha "SG_DB" como o grupo de segurança.
4. Adicione as regras de entrada necessárias ao "SG_DB" para permitir tráfego necessário.

#### Parte 2: Acesso ao Banco de Dados

**Passo 11: Revisão e Criação:**
1. Revise todas as configurações e clique em "Create database" para iniciar a criação do banco de dados.

**Passo 12: Acompanhamento da Criação:**
1. Aguarde até que a criação do banco de dados seja concluída. Isso pode levar alguns minutos.

**Passo 13: Acesso ao Banco de Dados:**
1. Uma vez que o banco de dados esteja criado, você pode obter o endpoint do banco de dados na página de detalhes do RDS.
2. Use um cliente PostgreSQL (como o pgAdmin) para se conectar ao banco de dados usando o endpoint, nome de usuário e senha que você configurou.

**Exemplo de URL de conexão PostgreSQL:**
```plaintext
postgresql://seu_usuario:sua_senha@endpoint_do_banco:5432/seu_banco_de_dados
	
```
## API para receber os áudios enviados pelo usuário

A API que recebe os aúdios enviados pelo usuário foi construída com a ajuda de uma função de "Speech to Text" que a própria IBM já fornece por meio da biblioteca do IBM Watson. O que recebe o áudio é na verdade uma função, que é posteriormente chamada em uma API de post.

Função "generateText()" que recebe e processa o áudio:
```
async function generateText(audio){
    try {
        const result = await speechToText.recognize({
            audio: audio,
            contentType: "audio/flac",
            model: "pt-BR_BroadbandModel",
            keywords: ["oi"],
            keywordsThreshold: 0.5,
            maxAlternatives: 3, 
        })

        return result.result.results[0].alternatives[0].transcript;
    } catch (error) {
        throw Error("Error recognizing audio");
    }
}
```
Como é possível perceber, a função espera como entrada um áudio em português no formato flac, e como saída, a transcrição desse áudio.

API de post que chama essa função juntamente com o áudio:
```
app.post("/text", async (req, res) => {
    try {
        const text = await generateText(req.body);
        console.log(text);

        res.status(200).json({
            message: text,
            audio: req.body.toString("base64"),
        });
    } catch (error) {
        res.status(500).json({
            message: error.message,
            audio: req.body.toString("base64"),
        });
    }

});
```

Além de chamar a função, essa API transforma o áudio para o formato de "base64" para que o tráfego dele em HTTP seja mais leve, já que o Flutter não consegue suportar tráfegos muito pesados.


# Documentação da Construção do Backend da Solução (Sprint 3)

## Backend preparado para receber os Webhooks 

Preencher seguindo as orientações da Adalove.

É possível referenciar os testes da pasta tests do repositório.

## Sistema de troca de mensagens para notificar os eventos

Preencher seguindo as orientações da Adalove.

É possível referenciar os testes da pasta tests do repositório.

## Frontend mínimo para realizar o teste da implementação do modelo

A interface do usuário foi desenvolvida de forma muito intuitiva e por isso contempla apenas 3 telas principais:
- Onboarding: essa é a primeia tela a qual o usuário é introduzido após o login na plataforma. Nela, são apresentados os dois diferentes modos (SalesTracker e MarketTracker) que a inteligência artificial possui. A diferença entre os modos é a forma como a resposta é apresentada ao usuário, já que cada um irá possuir um foco diferente.
- Home: após escolher o modo de apresentação de resposta, o usuário será direcionado para a tela principal, a qual possui alguns prompts já prontos que o usuário pode usar, o histórico de suas pesquisas antigas, e um botão que inicia um novo chat.
- Chat: essa é a página principal da aplicação, a qual o usuário poderá se comunicar com a inteligêcia artificial e fazer perguntas por voz ou por texto.

Cada uma dessas telas possuem componentes importantes, sendo eles:
- Campos de entrada: o usuário pode chamar a inteligência artificial de 2 maneiras, por voz ou por texto. Ambas se localizam na aba de chat.
- Botões: os botões principais da nossa aplicação são: o que permite trocar de modo (vendas e marketing), o "Go Chat", que direciona o usuário para a tela de chat, e dois últimos que representam o meio do usuário de comunicar com a inteligência artificial, um para a fala, e outro para texto.
- Exibição de resultados: Após o usuário perguntar para a AI o que ele deseja, será possível visualizar o que foi mandado em forma de uma mensagem no chat. Considerando isso, a resposta recebida também é em formato de mensagem, e pode englobar um texto, fontes de pesquisas e gráficos.

Além disso, a conexão do frontend com o backend é feita por meio do protocolo HTTPS, e contém apenas 2 APIs, uma que recebe um áudio, e outra que o tranforma por meio do Speech do Text em um texto e retorna o mesmo para o usuário. Posteriormente, será implementada uma função na qual o usuário poderá escutar a resposta além de apenas visualizá-la.

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
