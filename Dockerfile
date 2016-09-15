FROM junhanlin/ubuntu-git-java-maven
VOLUME /tmp

RUN git clone https://github.com/alexturcot/sample-spring-boot-data-mongodb-embedded.git
WORKDIR sample-spring-boot-data-mongodb-embedded
RUN mvn install

WORKDIR target
RUN mv *.jar app.jar

ENTRYPOINT ["java","-jar","/sample-spring-boot-data-mongodb-embedded/target/app.jar"]
