# Tutorial: Configurando uma Instância EC2 na AWS e Hospedando um Backend em JavaScript

## Parte 1: Criando uma Instância EC2 na AWS

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

## Parte 2: Hospedando um Backend em JavaScript

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
