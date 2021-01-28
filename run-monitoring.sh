#!/usr/bin/env bash

#download java agent in the target to scrap

sudo wget -P /home/haifa/  https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.11.0/jmx_prometheus_javaagent-0.11.0.jar


#define jmx exporter config file / This configuration file contains rules for rewriting JMX MBeans to the Prometheus exposition format metrics. Basically, it’s a collection of regexps to convert MBeans strings to Prometheus strings


# run spark job after extending driver with jmx exporter java agent
spark-submit --master local --class com.greenflex.IQ.Main  \
  --conf spark.network.timeout=10000000 \
  --conf "spark.driver.extraJavaOptions=-javaagent:/path-jmw-agent/jmx_prometheus_javaagent-0.11.0.jar=8082:/home/user/jmx/project/kafka-2_0_0.yml" /home/user/project/scala/kafkasparkConsumer/target/scala-2.11/kafkasparkconsumer-assembly-0.1.0-SNAPSHOT.jar



#define prommetheus config file


#run prometheus server

docker run -d --net=host     -v /home/user/jmx/project/prometheus.yml:/etc/prometheus/prometheus.yml     --name prometheus-server-poc     prom/prometheus
