![image](estacio.png)

**Nome:** Jamison Queiroz\
**Matrícula:** 202208101127\
**Curso:** Desenvolvimento Full Stack\
**Turma:** 2022.4\
**Professor:** Guilherme Dutra Gonzaga Jaime\
**Disciplina:** Software Sem Segurança Nao Serve


## Missão Certificação Mundo 5

Este projeto tem o objetivo de trabalhar com conceitos de design e arquitetura de software, análise e levantamento de requisitos, tratamento de exceções e erros, criação de webservice e integração entre aplicações/API’s distintas, realização de transação com Sistema Gerenciador de Banco de Dados (SGBD), trabalhar com versionamento e desenvolver solução jurídica para um cenário real de necessidade do judicial nacional.

## Recursos

- Linguagem de programação JavaScript; 
- Banco de Dados Open Source PostgreSQL; 
- Versionado através do Git / Github; 

## Orientação

* O arquivo **mission.sql** contém uma cópia do banco utilizado.

## Executar e Testar

Para iniciar o servidor, execute:
bash
Copiar código:
´´´
node index.js
´´´
- Agora, siga os passos no Postman para testar a API.

3. Testando a API no Postman
Passo 1: Criar Requisição de Login
Abra o Postman e crie uma nova requisição POST para o endpoint http://localhost:3000/api/auth/login.
No Body, escolha a opção raw e altere para JSON.
Envie os seguintes dados no corpo da requisição:
json
Copiar código
{
    "username": "admin",
    "password": "123456"
}
Isso retornará um token JWT, que será usado nas próximas requisições.
Passo 2: Testar Requisição Protegida (Recuperar Usuário Logado)
Crie uma nova requisição GET para o endpoint http://localhost:3000/api/me.
Na aba Authorization, selecione o tipo Bearer Token e insira o token JWT gerado no login anterior.
Envie a requisição. Se o token for válido, você verá os dados do usuário logado.
Passo 3: Testar o Controle de Acesso (Recuperar Contratos)
Crie uma nova requisição GET para o endpoint http://localhost:3000/api/contracts/{empresa}/{inicio}. Exemplo: http://localhost:3000/api/contracts/myCompany/2024-01-01.
Na aba Authorization, selecione novamente o tipo Bearer Token e insira o token JWT do login de um usuário com perfil de admin.
Se tudo estiver correto, você deverá receber os contratos cadastrados no banco de dados para a empresa e data fornecidos.


