# A few common scripts used in my circleci + docker/gke(kubernetes) system

# Environment
These scripts expect the following env vars:

- PROJECT_NAME (gcp project id)
- CLUSTER_NAME (gke cluster name)
- CLUSTER_ZONE (availability-zone of the gke cluster)
- APP_NAME (pod label: app = <app_name>) 
- GCLOUD_SERVICE_KEY (should contain the gcp service account json, base64 encoded)

