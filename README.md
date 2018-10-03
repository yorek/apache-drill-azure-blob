# Apache Drill on Azure Blob

A simple way to run Apache Drill against Azure Blob store.

**Notes** 

This repo is a companion of this Medium post: 

https://medium.com/@mauridb/apache-drill-azure-blobs-and-azure-stream-analytics-ef34a1360d2b

and the official Apache Drill documentation:

https://drill.apache.org/docs/azure-blob-storage-plugin/ 

**Running Drill**

Just run:

    docker run -it --rm -d --name drill -p 8047:8047 -t yorek:apache-drill-azure-blob /bin/bash

to run Apache Drill in background. You can now connect to the web interface 

http://localhost:8047

or you can connect via the terminal:

    docker attach drill

