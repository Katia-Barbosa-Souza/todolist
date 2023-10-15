# Use uma imagem base com OpenJDK 17
FROM adoptopenjdk:17-jre-hotspot AS build

# Crie um diretório de trabalho
WORKDIR /app

# Copie o código-fonte e o arquivo pom.xml para o contêiner
COPY . .

# Instale o Maven e compile o projeto
RUN apt-get update && apt-get install -y maven
RUN mvn clean install

# Troque para a imagem OpenJDK 17 slim para a execução
FROM openjdk:17-jre-slim

# Exponha a porta 8080, se necessário
EXPOSE 8080

# Copie o arquivo JAR gerado a partir da etapa anterior
COPY --from=build /app/target/todolist-1.0.0.jar /app/app.jar

# Defina o ponto de entrada para a execução do aplicativo
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
