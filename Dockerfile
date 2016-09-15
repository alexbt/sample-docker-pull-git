FROM junhanlin/ubuntu-git-java-maven
VOLUME /tmp
ENV project_name sample-docker-pull-git

RUN git clone https://github.com/alexturcot/${project_name}.git
WORKDIR ${project_name}
RUN mvn install

WORKDIR target
RUN mv *.jar app.jar

ENTRYPOINT ["java","-jar","/${project_name}/target/app.jar"]
