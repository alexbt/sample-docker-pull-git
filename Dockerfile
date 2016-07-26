FROM junhanlin/ubuntu-git-java-maven
VOLUME /tmp

RUN git clone https://github.com/alexturcot/example-docker-build-git-project.git
WORKDIR example-docker-build-git-project
RUN mvn install

WORKDIR target
RUN mv *.jar app.jar
RUN sh -c 'touch /example-docker-build-git-project/target/app.jar'
ENTRYPOINT ["java","-jar","/example-docker-build-git-project/target/app.jar"]