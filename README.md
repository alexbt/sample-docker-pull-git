Dockerfile - building a git project
-------------------
This project showcases how you can use Docker to fetch a git project, build it and Dockerize it. The Dockerfile I'm using is as simple as this:
```
FROM junhanlin/ubuntu-git-java-maven
VOLUME /tmp

RUN git clone https://github.com/alexturcot/sample-spring-boot-data-jpa-embedded.git
WORKDIR sample-spring-boot-data-jpa-embedded
RUN mvn install

WORKDIR target
RUN mv *.jar app.jar

ENTRYPOINT ["java","-jar","/sample-spring-boot-data-jpa-embedded/target/app.jar"]
````


In order to perform the *git clone* and *mvn install*, the image needs to have git installed, jdk8 and maven as well. I looked around and found **junhanlin/ubuntu-git-java-maven**'s Dockerfile. Using his Dockerfile as a foundation, all that was left to do in mine is to:

* fetch the project from git: RUN git clone https://github.com/alexturcot/sample-spring-boot-data-jpa-embedded.git
* build it with maven: RUN mvn install
* launch the application at startup: ENTRYPOINT ["java","-jar","/sample-spring-boot-data-jpa-embedded/target/app.jar"]


Step by step - Ooh baby
-------------------

To install docker, follow their instrution: https://docs.docker.com/engine/installation

**Build this docker image**

The first step is to create a Dockerfile. You may download the Dockerfile from this repository and drop it where you wish.
Then go into the folder containing the Dockerfile and type:

    $ docker build -t sample-spring-boot-data-jpa-embedded:latest .

This builds the image named *example-spring-boot-docker* using the Dockerfile in current directory, with tag *latest*.

```
Sending build context to Docker daemon 160.8 kB
Step 1 : FROM junhanlin/ubuntu-git-java-maven
latest: Pulling from junhanlin/ubuntu-git-java-maven
6599cadaf950: Downloading 15.13 MB/65.69 MB
23eda618d451: Download complete
f0be3084efe9: Download complete
52de432f084b: Download complete
a3ed95caeb02: Download complete
df795cb63d4e: Downloading 13.74 MB/21.61 MB
8a129a343884: Download complete
125c23d71697: Download complete
f7acce206ed4: Downloading 4.658 MB/7.008 MB
15995c5d2cff: Waiting
35c1e24633a2: Waiting
cbdce6edf507: Waiting
ac4553028b08: Waiting
e7f664869d5d: Waiting
62465d934146: Waiting
38c6c2c5be52: Waiting
39313924067c: Waiting
```

This builds your first docker image.
Once it's done, you can view the images added to your local repository:

    $ docker images

```
REPOSITORY                              TAG                 IMAGE ID            CREATED             SIZE
sample-spring-boot-data-jpa-embedded    latest              226b42be11a0        3 minutes ago       871.2 MB
junhanlin/ubuntu-git-java-maven         latest              c0e8627e844e        12 weeks ago        790.7 MB
```

**Launching your container**

To launch the container (a running image is referred to as a container, kind of like a Class and an Object)

    $ docker run -e spring_profiles_active=dev -p 8080:8080 -i -t sample-spring-boot-data-jpa-embedded:latest

In my case, the entrypoint of my image is a spring boot application.
* -e spring_profiles_active=dev  is to provide a spring profile
* -p 8080:8080 is to open port on the docker container, so that I can reach it from my computer.

You can browse to `http://localhost:8080/jpa/repo`, to access the dockerized application. That's it.
