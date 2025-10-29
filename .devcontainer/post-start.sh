#!/usr/bin/env bash
set -euo pipefail
mkdir -p $HOME/.gcp
if [ -n "${BIGQUERY_KEYFILE_JSON:-}" ]; then
  echo "$BIGQUERY_KEYFILE_JSON" > $HOME/.gcp/keyfile.json
  export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/keyfile.json"
  echo "GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS" >> $HOME/.bashrc
fi
echo "BIGQUERY_PROJECT=${BIGQUERY_PROJECT:-}" >> $HOME/.bashrc
echo "BIGQUERY_DATASET=${BIGQUERY_DATASET:-}" >> $HOME/.bashrc
echo "BIGQUERY_LOCATION=${BIGQUERY_LOCATION:-US}" >> $HOME/.bashrc
