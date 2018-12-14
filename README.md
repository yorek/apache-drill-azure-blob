# Apache Drill on Azure Blob

A simple way to run Apache Drill against Azure Blob store. 

**Notes** 

This repo is a companion of this Medium post: 

https://medium.com/@mauridb/apache-drill-azure-blobs-and-azure-stream-analytics-ef34a1360d2b

and the official Apache Drill documentation:

https://drill.apache.org/docs/azure-blob-storage-plugin/ 

This branch, more specifically, is used to build and publish to Docker Hub an container that can be used right away to run Apache Drill, without any additional build process. 

https://github.com/yorek/apache-drill-azure-blob/tree/dockerhub

This is great for testing or running ad-hoc queries, but keep in mind that the storage configuration will be visibile and accessibile to everyone. If you have specific security requirements, you may want to build and use a Container image where the storage account is not visibile to the end user. You can find the instruction to do so in the *master* branch.

https://github.com/yorek/apache-drill-azure-blob/tree/master

**Running Drill**

Just run:

    docker run -it --rm -d --name drill -p 8047:8047 -t yorek/apache-drill-azure-blob /bin/bash

to run Apache Drill in background. You can now connect to the web interface 

http://localhost:8047

or you can connect via the terminal:

    docker attach drill

**Running Drill on Azure**

If you want to query data stored in a blob store it's much better from a performance and cost saving perspective to run also Drill on Azure, so that files doesn't need to be moved to your client in order to be queries.

Right now I haven't been able to run the docker image in Azure Container Instances, so the best way to have the docker image runnin in Azure is to create a Ubuntu 18.04 VM and then run the docker image from there.

Once you have the VM created you can install docker by following this doc:

https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1


