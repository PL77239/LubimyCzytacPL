# Etap 1: Budowanie aplikacji przy użyciu oficjalnego środowiska z Javą 21
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app

# Kopiujemy plik konfiguracyjny i kod źródłowy
COPY pom.xml .
COPY src ./src

# Budujemy aplikację (omijamy Windowsowy plik mvnw!)
RUN mvn clean package -DskipTests

# Etap 2: Uruchomienie gotowej aplikacji w lekkim środowisku Javy
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# Kopiujemy zbudowany plik .jar z poprzedniego etapu
COPY --from=build /app/target/*.jar app.jar

# Udostępniamy port i odpalamy serwer Spring Boot
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
