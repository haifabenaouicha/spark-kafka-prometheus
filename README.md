# spark-kafka-prometheus
A sample application for monitoring a spark streaming job reading data from kafka with prometheus server. 

The aim of this repo is to show a simple way to collect jmx metrics for a kfka application running with structured streaming.
To collect jmx metrics we inject the jmx exporter java agent to the class path of the spark driver.
 ## Requirements:
  - Spark
  - Zookeeper
  - Kafka
  - Docker

  