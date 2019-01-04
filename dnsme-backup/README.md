# Backup DNS Made Easy records

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/dnsme-backup.svg)](https://hub.docker.com/r/zcalusic/dnsme-backup/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/dnsme-backup.svg)](https://hub.docker.com/r/zcalusic/dnsme-backup/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/dnsme-backup.svg)](https://microbadger.com/images/zcalusic/dnsme-backup/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/dnsme-backup.svg)](https://microbadger.com/images/zcalusic/dnsme-backup/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/dnsme-backup.svg)](https://microbadger.com/images/zcalusic/dnsme-backup/)
[![License](https://images.microbadger.com/badges/license/zcalusic/dnsme-backup.svg)](https://microbadger.com/images/zcalusic/dnsme-backup/)

Backup DNS Made Easy records to file system, in two convenient formats.

## Example Kubernetes manifest

```yaml
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: dnsme-backup
spec:
  # UTC
  schedule: "0 0 * * *"
  concurrencyPolicy: Replace
  jobTemplate:
    spec:
      template:
        spec:
          restartPolicy: OnFailure
          containers:
          - name: dnsme-backup
            image: zcalusic/dnsme-backup
            imagePullPolicy: Always
            volumeMounts:
            - name: dnsme-data
              mountPath: /data
            env:
            - name: DNSME_API_URL
              value: http://api.dnsmadeeasy.com/V1.2
            - name: DNSME_API_KEY
              value: 8j7dn64b-83jc-48jd-0913-98wrhjd601df
            - name: DNSME_SECRET_KEY
              value: 93jsmq86-11hs-00ls-tnd8-8djdnb98a74c
          volumes:
          - name: dnsme-data
            hostPath:
              path: /opt/dnsme
              type: DirectoryOrCreate
```
