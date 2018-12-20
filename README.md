# Apache Drill on Azure Blob

A simple way to run Apache Drill (embedded mode) against Azure Blob store. 

> NOTE: Apache Drill is installed in the "embedded" mode. This is recommeneded only for testing purposes. If you need a scalable solution you should install Apache Drill in "distributed" mode. https://drill.apache.org/docs/install-drill-introduction/

**Detailed Articles** 

This repo is a companion of this Medium post: 

https://medium.com/@mauridb/apache-drill-azure-blobs-and-azure-stream-analytics-ef34a1360d2b

and the official Apache Drill documentation:

https://drill.apache.org/docs/azure-blob-storage-plugin/

**Building and Running the Image**

With this approach you'll customize the storage plugin configuration so that the Azure Blob Storage Key will never be visible to the user using Drill. This is the most secure way to run Drill against Azure Blob Storage, but it requires you to *build* your own image and then run it.

Make sure you have Docker installed and configured to support Linux containers.

Configure the files conf/core-size.xml and conf/storage-plugins-override.conf as described in one of the above articles and then build the Docker image:

    docker build . -f Dockerfile-Custom -t azure-drill

Once the image is ready, run it:

    docker run -it --rm -d --name drill -p 8047:8047 -t azure-drill /bin/bash    

this will run the image in detached mode, and you can then query your files directly on Azure the web UI available at 

http://localhost:8047

if you prefer to use the console shell, you need to attach your terminale to the running container

    docker attach drill

**Running the pre-built image**

If you don't need a more secure environment like the one described above, you can just use the image available at docker hub:

Just run:

    docker run -it --rm -d --name drill -p 8047:8047 -t yorek/apache-drill-azure-blob /bin/bash

to run Apache Drill in background. You can now connect to the web interface 

http://localhost:8047

or you can connect via the terminal:

    docker attach drill

Please note that this approach is great for testing or running ad-hoc queries, but keep in mind that the storage configuration will be visibile and accessibile to everyone. If you have specific security requirements, you may want to build and use a Container image where the storage account is not visibile to the end user. You can find the instruction in the previous section.

**Running the pre-built image in Azure**

If you want to query data stored in a blob store it's much better from a performance and cost saving perspective to run also Drill on Azure, so that files doesn't need to be moved to your client in order to be queries.

Right now I haven't been able to run the docker image in Azure Container Instances, so the best way to have the docker image runnin in Azure is to create a Ubuntu 18.04 VM and then run the docker image from there.

Once you have the VM created you can install docker by following this doc:

https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1

after that VM is running you can choose one of the two described options (custom image or pre-built image) to run the Apache Drill docker container in the VM.

If you want to go with full automation, you can create and run Apache Drill in a VM using the script available in the `vm` folder:

    cd vm
    ./create-azure-vm.sh

The script will create a VM named `apache-drill` into the `drill` Resource Group in the `WestUs2` region.

The VM will be set up using the script availabe in `vm/setup-drill.sh` via [cloud-init](https://launchpad.net/cloud-init) and the Docker image will be pulled and executed.

After a few minutes Apache Drill Embedded will be up and running.

> NOTE: Apache Drill is installed in the "embedded" mode. This is recommeneded only for testing purposes. If you need a scalable solution you should install Apache Drill in "distributed" mode. https://drill.apache.org/docs/install-drill-introduction/
