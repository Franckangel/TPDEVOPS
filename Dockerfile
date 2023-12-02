# Use a base image with Java from Bitnami
FROM bitnami/java:latest

# Set the working directory
WORKDIR /app

# Copy all files from the current directory into the container
COPY . /app/

# Run Maven to build the application
RUN apt-get update && apt-get install -y maven && mvn clean install

# Command to run when the container starts
CMD ["java", "-jar", "/app/myproject-1.0-SNAPSHOT.jar"]

