# kube-test

just some simple tests to learn kube  

## Build docker image from git repo  

build this image  

```shell
$:docker build -t <name>:<version> gitrepo  
```  

check whether this image has been succefully built  

```shell
$ docker images  
```

run the image and check its status  

```shell
$ docker run -d git-test  
$ docker ps  
```

watch the result  

```shell
$ docker exec -it <name> /bin/bash  
$ top  
$ tailf test.txt  
```
stop the container  

```shell
$ docker stop <name>  
```

## Create k8s cpu deployment  

creat the deployment  

```shell
$ kubectl create -f cpu-deployment.yaml
```

## Mount persistent volume  

create persistent volume and persistent volume claim

```shell
$ kubectl create -f pv.yaml
$ kubectl create -f pvc.yaml
```  

create deployment

```shell
$ kubectl create -f k8s-vol.yaml
```  

validate  

```shell
$ kubectl exec -it <pod name> -- /bin/bash
$ echo 'hello' > /cyp/cyp.tmp
$ exit
$ kubectl exec -it <another pod name> -- /bin/bash
$ cat /cyp/cyp.tmp
$ exit
$ kubectl delete -f k8s-vol.yaml
$ cat /tmp/data/cyp.tmp
```  
the message written into cyp.tmp still exists even after pods deleted.

## Create k8s gpu deployment  

creat the deployment  

```shell
$ cd gpu-test

(this should executed on the worker nodes machine)
$ build -t vec:cu9.0 .

$ kubectl create -f gpu-deployment.yaml
```
