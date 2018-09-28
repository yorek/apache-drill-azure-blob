# Apache Drill on Azure Blob

A simple way to run Apache Drill against Azure Blob store.

## Notes

This repo is a companion of this Medium post: 

https://medium.com/@mauridb/apache-drill-azure-blobs-and-azure-stream-analytics-ef34a1360d2b

and the official Apache Drill documentation:

https://drill.apache.org/docs/azure-blob-storage-plugin/ 

## Run Apache Drill

Make sure you have Docker installed and condigured to support Linux containers (if you're using Windows).

Configure the files `conf/core-size.xml` and `conf/storage-plugins-override.conf` as descrived in one of the above articles and then build the Docker image using `drill-build.bat`.

Once the image is ready, run it using `drill-run.bat`

and you can then start query your files directly on Azure.