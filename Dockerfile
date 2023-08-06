# First stage: Java build environment
FROM maven:3.8.1-openjdk-11 as build
WORKDIR /app
RUN git clone https://git.kyleyannelli.com/kyle/KMusicBot.git .
RUN mvn javadoc:javadoc

# Second stage: Nginx server
FROM nginx:alpine
COPY --from=build /app/target/site/apidocs /usr/share/nginx/html
EXPOSE 80

