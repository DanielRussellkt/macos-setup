#!/usr/bin/env bash

# This cannot be done headlessly with a user account as of yet, gcloud init needs to open the browser to authenticate with google account.
# This will need manual intervention in order to set up properly
gcloud init

# Configuring clusters will need to be done after this;
# gcloud container clusters get-credentials cluster_name --zone geo_zone --project project_name