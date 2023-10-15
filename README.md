## API de Tarefas com Spring Boot

Bem-vindo à API de Tarefas construída durante o curso gratuito da Rocketseat, abstraindo recursos do Spring Boot. Esta API tem como objetivo fornecer uma plataforma para gerenciar suas tarefas de forma eficiente, com validação de rotas, uso de criptografia BCrypt e funcionalidades avançadas.

## Sobre
- O curso foi dividido em 5 aulas:
  - **Aula 01 - Construção back-end de uma aplicação de To-Do List**
    - Na primeira aula demos primeiros passos em Java e na construção da aplicação. Vimos os conceitos essenciais do Spring Boot e configuramos o ambiente de desenvolvimento com Java e Maven, instalando extensões e criando a estrutura do projeto.
  - **Aula 02 - Integração com Banco de Dados**
    - Na segunda aula aprendermos mais sobre desenvolvimento em Java, Spring Framework e interações com banco de dados e seguimos na construção do projeto usando as ferramentas mais modernas.
  - **Aula 03 - Implementando segurança nos dados do usuário**
    - Na terceira aprendemos aspectos cruciais de segurança e estruturação para garantir um acesso seguro à sua aplicação.
  - **Aula 04 - Atualizando tarefas e validação de rotas**
    - Nessa aula implementamos melhorias e funcionalidades e enriquecemos a interatividade do usuário com a nossa aplicação.
  - **Aula 05 - Deploy do Back-End**

### Recursos da API

- **Criação de Tarefas:** Crie uma nova tarefa especificando a descrição, título, prioridade, data de início e término. Você deve fornecer o ID do usuário no parâmetro `idUser`:

```http
POST http://localhost:8080/tasks/
{
    "description": "Tarefa para gravar aula de Tasks do curso de Spring Boot",
    "title": "Gravação de aula",
    "priority": "ALTA",
    "startAt": "2023-10-11T10:00:00",
    "endAt": "2023-10-11T14:00:00",
    "idUser": "750cd181-dd27-414d-bc72-e09197b1a341"
}
```

- **Criação de Usuários:** Crie um novo usuário fornecendo seu nome, nome de usuário e senha:

```http
POST http://localhost:8080/users/
{
    "name": "Katia Souza",
    "username": "katiasouza",
    "password": "12345"
}
```

### Recursos do Controlador

Aqui estão alguns trechos do código do controlador da API:

```java
@PostMapping("/")
public ResponseEntity create(@RequestBody TaskModel taskModel, HttpServletRequest request) {
    var idUser = request.getAttribute("idUser");
    taskModel.setIdUser((UUID) idUser);
    
    var currentDate = LocalDateTime now();
    if (currentDate.isAfter(taskModel.getStartAt()) || currentDate.is after(taskModel.getEndAt())) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
            .body("A data de início / data de término devem ser maiores que a data atual");
    }
    if (taskModel.getStartAt().is after(taskModel.getEndAt())) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
            .body("A data de início deve ser menor que a data de término");
    }

    var task = this.taskRepository.save(taskModel);

    return ResponseEntity.status(HttpStatus.OK).body(task);
}
```

### Filtro de Autenticação

A API utiliza um filtro de autenticação para garantir que apenas usuários autorizados acessem determinadas rotas. Aqui está um trecho do código do filtro:

```java
@Override
protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
    throws ServletException, IOException {
    var servletPath = request.getServletPath();
    
    if (servletPath.startsWith("/tasks/")) {
        // Verificar a autenticação (usuário e senha)
        // Validação do usuário e senha com BCrypt
    } else {
        filterChain.doFilter(request, response);
    }
}
```

Este filtro de autenticação verifica se as solicitações para as rotas que começam com `/tasks/` estão autenticadas. Os detalhes da autenticação do usuário e a validação da senha são tratados com segurança.



### Utilização do Spring Boot DevTools

Esta API utiliza o Spring Boot DevTools, uma ferramenta útil para auxiliar no desenvolvimento de aplicativos Spring Boot. Ele oferece recursos que facilitam o processo de desenvolvimento, incluindo a reinicialização automática do serviço toda vez que a aplicação sofre uma alteração no código-fonte.

### Publicação em Render.com

Você pode publicar esta API gratuitamente utilizando o serviço Render. Siga os passos abaixo:

1. Acesse o site oficial [Render](https://render.com/).
2. Faça o cadastro (você pode utilizar sua conta do GitHub para facilitar o processo).
3. Crie um arquivo `Dockerfile` na raiz do seu projeto com as instruções necessárias para a publicação no Render.
4. Siga as instruções do Render para implantar sua aplicação e configure os detalhes conforme necessário.