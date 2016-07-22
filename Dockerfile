FROM junhanlin/ubuntu-git-java-maven
VOLUME /tmp

RUN git clone https://github.com/alexturcot/example-spring-boot-data-jpa-embedded.git
WORKDIR example-spring-boot-data-jpa-embedded
RUN mvn install

WORKDIR target
RUN mv *.jar app.jar
RUN sh -c 'touch /example-spring-boot-data-jpa-embedded/target/app.jar'
ENTRYPOINT ["java","-jar","/example-spring-boot-data-jpa-embedded/target/app.jar"]