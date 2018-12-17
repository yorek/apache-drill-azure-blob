FROM drill/apache-drill:1.14.0

WORKDIR /opt/drill/jars/3rdparty

RUN curl http://central.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.7/hadoop-azure-2.7.7.jar -o adoop-azure-2.7.7.jar
RUN curl http://central.maven.org/maven2/com/microsoft/azure/azure-storage/8.0.0/azure-storage-8.0.0.jar -o azure-storage-8.0.0.jar

WORKDIR /opt/drill

COPY conf ./conf

WORKDIR /