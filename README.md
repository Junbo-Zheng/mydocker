# mydocker
Create a basic docker image based on ubuntu 22.04.

## Create image
```
docker build -t mydocker .
```

It will show the new image if build success by `docker images` or `docker image ls`, as follow:
```
➜  /Users/junbozheng docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
mydocker     latest    0c3ba3cd06a9   37 minutes ago   216MB
```

## Run image
```
docker run -i -t mydocker /bin/zsh
```

## Run image (mount local volume)
```
docker run -it -v /User/junbozheng/project:/home/mi/work mydocker
```
`/User/junbozheng/project` is the path location to Host, and `/home/mi/work` is the path location already created in the **mydocker** container. Now you can access all the files in the native path in the container, and they are completely synchronized.

## List containers
```
➜  /Users/junbozheng docker ps -a
CONTAINER ID   IMAGE      COMMAND      CREATED              STATUS          PORTS     NAMES
e7d4f53413c9   mydocker   "/bin/zsh"   About a minute ago   Up 59 seconds             happy_mcclintock
```

## Remove some images
You can refer [here](https://blog.csdn.net/sinat_39308893/article/details/122043748) for more information if you are interested.

```
docker rmi IMAGEID1 IMAGEID2 IMAGEID3 ...
```

## Remove some containers
You can refer [here](https://jingyan.baidu.com/article/11c17a2c088605b547e39d71.html) for more information if you are interested.

```
docker rm containerID1 containerID2 containerID3 ...
```

## Get help
If you want to know how to use a command, you can view it in the following way:
```
docker you_command --help
```
**`you_command`** indicates the command you want to use. For example:
```
➜  /Users/junbozheng docker rmi --help

Usage:  docker rmi [OPTIONS] IMAGE [IMAGE...]

Remove one or more images

Options:
  -f, --force      Force removal of the image
      --no-prune   Do not delete untagged parents
```
