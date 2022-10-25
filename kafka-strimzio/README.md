# Using Prometheus with Strimzi
You can use Prometheus to provide monitoring data for the example Grafana dashboards provided with Strimzi.

To expose metrics in Prometheus format, you add configuration to a custom resource. You will also need to make sure that the metrics are scraped by your monitoring stack. Prometheus and Prometheus Alertmanager are used in the examples provided by Strimzi, but you can use also other compatible tools.

1. Deploying Prometheus metrics configuration

2. Setting up Prometheus

3. Deploying Prometheus Alertmanager

## Deploying Prometheus metrics configuration
Deploy Prometheus metrics configuration to use Prometheus with Strimzi. Use the metricsConfig property to enable and configure Prometheus metrics.

You can use your own configuration or the example custom resource configuration files provided with Strimzi.

* kafka-metrics.yaml

* kafka-connect-metrics.yaml

* kafka-mirror-maker-2-metrics.yaml

* kafka-bridge-metrics.yaml

* kafka-cruise-control-metrics.yaml

The example configuration files have relabeling rules and the configuration required to enable Prometheus metrics. Prometheus scrapes metrics from target HTTP endpoints. The example files are a good way to try Prometheus with Strimzi.

To apply the relabeling rules and metrics configuration, do one of the following:

* Copy the example configuration to your own custom resources

* Deploy the custom resource with the metrics configuration

If you want to include Kafka Exporter metrics, add kafkaExporter configuration to your Kafka resource.


> {IMPORTANT} Kafka Exporter provides only additional metrics related to consumer lag and consumer offsets. For regular Kafka metrics, you have to configure the Prometheus metrics in Kafka brokers.

This procedure shows how to deploy Prometheus metrics configuration in the Kafka resource. The process is the same when using the example files for other resources.