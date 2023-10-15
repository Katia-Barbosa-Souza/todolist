#### Rocketseat - Curso Online Gratuito de Java com Daniele Leão
# Projeto - Back End de Uma Aplicação de TODOLIST

## Sobre
- O curso foi dividido em 5 aulas:
  - **Aula 01 - Construção back-end de uma aplicação de To-Do List**
    - Nessa aula vamos dar os primeiros passos em Java e na construção da aplicação. Você vai ver conceitos essesnciais do Spring Boot e colocar a mão na massa configurando o ambiente de desenvolvimento com Java e Maven, instalando extensões e criando a estrutura do projeto.
  - **Aula 02 - Integração com Banco de Dados**
    - Nessa aula vamos aprender mais sobre desenvolvimento em Java, Spring Framework e interações com banco de dados e seguir na construção do projeto usando as ferramentas mais modernas.
  - **Aula 03 - Implementando segurança nos dados do usuário**
    - Nessa aula vamos aprender aspectos cruciais de segurança e estruturação para garantir um acesso seguro à sua aplicação.
  - **Aula 04 - Atualizando tarefas e validação de rotas**
    - Nessa aula vamos implementar melhorias e funcionalidades e enriquecer a interatividade do usuário com a nossa aplicação.
  - **Aula 05 - Deploy do Back-End**

## Instalando e Configurando o Java no Windows
- Instale a versão 17 do Java á partir do seguinte link [https://download.oracle.com/java/17/archive/jdk-17.0.6_windows-x64_bin.msi]
- Após a instalação, clique com o botão direito do mouse sobre `Este Computador` no Windows e em seguida `Propriedades`
- Localize e clique na opção `Configurações avançadas do sistema`
- Localize e clique no botão `Variáveis de Ambiente...`
- Localize o grupo `Variáveis do sistema` na parte de baixo do PopUp
- Se a opção `JAVA_HOME` existir na lista
  - Clique para selecionar a opção
  - Em seguida, clique no botão `Editar...`
  - Altere o campo `Valor da variável` para o caminho onde o Java está instalado, por exemplo, `C:\Program Files\Java\jdk-17`
- Se a opção `JAVA_HOME` não estiver cadastrada na lista
  - Clique no botão `Novo...`
  - No campo `Nome da variável` digite `JAVA_HOME`
  - No campo `Valoda da variável` digite o caminho onde o Java está instalado, por exemplo, `C:\Program Files\Java\jdk-17`
- Clique no botão `Ok` para confirmar as alterações
- Após garantir que a variável `JAVA_HOME` foi criada, localize a variável `Path` na listagem e em seguida clique no botão `Editar...`
- Adicione no PopUp o valor `%JAVA_HOME%\bin` e confirme as alterações clicando no botão `Ok`
- Para testar se o Java foi configurado com sucesso, abra o terminal (Command Prompt). Para isso, digite `Windows + R`, em seguida digite `cmd` e pressione `Enter`. Já no Prompt de Comando digite `java -version` e pressione `Enter`. Se estiver tudo ok, o terminal irá apresentar a versão do Java que está instalada.

## Instalando e Configurando o Maven no Windows
- Baixe o pacote do Maven no seguinte link [https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.zip]
- Na raiz do `C:` crie uma pasta com o nome `maven` e descompate o conteúdo do arquivo zip de forma que as pastas e arquivos fiquem na raiz do seguinte caminho `C:\maven\`
- Após a extração correta dos arquivos na pasta `C:\maven`, clique com o botão direito do mouse sobre `Este Computador` no Windows e em seguida `Propriedades`
- Localize e clique na opção `Configurações avançadas do sistema`
- Localize e clique no botão `Variáveis de Ambiente...`
- Localize o grupo `Variáveis do sistema` na parte de baixo do PopUp
- Localize a variável `Path` na listagem e em seguida clique no botão `Editar...`
- Adicione no PopUp o valor `C:\maven\bin` e confirme as alterações clicando no botão `Ok`
- Para testar se o Maven foi configurado com sucesso, abra o terminal (Command Prompt). Para isso, digite `Windows + R`, em seguida digite `cmd` e pressione `Enter`. Já no Prompt de Comando digite `mvn` e pressione `Enter`. Se estiver tudo ok, o terminal irá apresentar algumas configurações da ferramenta.

## Instalando e Configurando o Visual Studio Code no Windows
- Baixe e instale o VS Code à partir do seguinte link [https://code.visualstudio.com/Download]
- Após instalado, instale as seguintes extensões:
  - vscjava.vscode-java-pack
    - vscjava.vscode-java-debug
    - vscjava.vscode-java-test
    - vscjava.vscode-java-dependency
    - vscjava.vscode-maven
    - redhat.java
  - vscjava.vscode-spring-initializr
  - vmware.vscode-spring-boot
  - vscjava.vscode-spring-boot-dashboard
- Abra as Configurações do Visual Studio Code, também conhecido como `Settings` (`CTRL + ,`), pesquise por `Compact Folders` e caso esteje marcada, clique para desmarcar.

## Instando a Ferramenta Rest Client Insomnia no Windows
- Baixe e instale o Insomnia à partir do seguinte link [https://insomnia.rest/download]

## Criando o pacote de arquivos do projeto com o auxílio da Spring Initializr
- Acesso o site [https://start.spring.io/]
- Configure os seguintes parâmetros:
  - Em `Project` selecione a opção `Maven`
  - Em `Language` selecione a opção `Java`
  - Em `Spring Boot` selecione a opção mais recente que não possua nenhuma informação adicional entre parêntese, no meu caso, `3.1.4`
  - Em `Project Metadata` informe os seguintes dados:
    - Em `Group`, pro convenção, digite o path do seu site ao contrário, no meu caso, `br.com.socodigo`
    - Em `Artifact` digite o nome projeto sem espaços, no meu caso, `todolist`
    - Em `Description` digite uma descrição para o projeto, no meu caso, `Gerenciador de tarefas`
    - Em `Packaging` selecione a opção `Jar`
    - Em `Java` selecione a opção `17`
  - Em `Dependencies` clique no botão `ADD DEPENDENCIES... CTRL + B` e em seguida localize a dependência `Spring Boot DevTools`
- Para baixar o pacote de arquivos já com tudo configurado, clique no botão `GENERATE CTRL + ENTER`
- Descompate o conteudo do arquivo em uma pasta para iniciar o desenvolvimento da aplicação.

## Configurando o Spring Boot DevTools
- O Spring Boot DevTools é uma ferramenta útil para auxiliar no desenvolvimento de aplicativos Spring Boot. Ele oferece recursos que facilitam o processo de desenvolvimento.

### Reinicialização Automática
- O Spring Boot DevTools permite reiniciar automaticamente o serviço toda vez que a aplicação sofre uma alteração no código-fonte. Isso evita a necessidade de encerrar e reiniciar manualmente o serviço após cada alteração.

### Executando a Aplicação
- Para rodar a aplicação, geralmente você encontra uma classe Java na raiz do projeto que possui a anotação `@SpringBootApplication` e um método `main` do tipo `public static void`. Existem duas opções para executar a aplicação:
	- **Opção "Run" e "Debug":**
		- Essas opções estão disponíveis na parte superior do ambiente de desenvolvimento.
    - Ambas permitem executar a aplicação.
    - A opção "Debug" permite parar em breakpoints para depurar problemas ou examinar o conteúdo de variáveis.
		- Exemplo de hierarquia de pastas:
			- No exemplo, a classe principal fica em `src/main/java/br/com/socodigo/todolist/TodolistApplication.java`.
    	- O pacote do projeto é `br.com.socodigo.todolist`.
    	- A classe `TodolistApplication` é marcada com a anotação `@SpringBootApplication`, indicando que ela é a classe principal.
    	- O método `public static void main` é usado para iniciar a execução do projeto.
	- **Executando com o Maven:**
		- Você pode usar o comando abaixo para executar a aplicação através do Maven:
```
$ mvn spring-boot:run
```



## Adicionando dependências no projeto
- Abra o arquivo `pom.xml`
- As dependências encontram-se mapeadas entre as TAGs `<dependencies></dependencies>`
- Segue uma relação das dependências atuais do projeto:
```
<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-devtools</artifactId>
			<optional>true</optional>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-actuator</artifactId>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jpa</artifactId>
		</dependency>

		<dependency>
			<groupId>com.h2database</groupId>
			<artifactId>h2</artifactId>
			<scope>runtime</scope>
		</dependency>

		<dependency>
			<groupId>org.projectlombok</groupId>
			<artifactId>lombok</artifactId>
			<version>1.18.30</version>
			<scope>provided</scope>
		</dependency>

		<dependency>
			<groupId>at.favre.lib</groupId>
			<artifactId>bcrypt</artifactId>
			<version>0.10.2</version>
		</dependency>
	</dependencies>
```

## Publicando a aplicação em um Host Gratuito
- Existem várias formas de publicar a versão da nossa aplicação em produção, e neste projeto vamos testar um Host Gratuito conhecido como Render, segue o link do Site Oficial [https://render.com/]
- Ao acessar o site pela primeira vez, é necessário fazer um cadastro. Para facilitar o processo, utilize a sua conta do GitHub
- Neste exemplo vamos utilizar o Docker para subir uma imagem com todas as configurações do Java, isso facilita a publicação no ambiente
- Crie o arquivo `Dockerfile` na raiz do projeto, e adicione as instruções que serão aplicadas no `Render` para a publicação da aplicação no `Docker`