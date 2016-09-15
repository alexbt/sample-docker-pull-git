FROM junhanlin/ubuntu-git-java-maven
VOLUME /tmp

RUN git clone https://github.com/alexturcot/sample-spring-boot-data-jpa-embedded.git
WORKDIR sample-spring-boot-data-jpa-embedded
RUN mvn install

WORKDIR target
RUN mv *.jar app.jar

ENTRYPOINT ["java","-jar","/sample-spring-boot-data-jpa-embedded/target/app.jar"]
