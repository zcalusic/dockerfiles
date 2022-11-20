# Run Geth official Go execution layer implementation of the Ethereum protocol in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/geth.svg)](https://hub.docker.com/r/zcalusic/geth/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/geth.svg)](https://hub.docker.com/r/zcalusic/geth/)

Run [Geth](https://geth.ethereum.org/) official Go execution layer implementation of the Ethereum protocol in a Docker container.

## Usage

Pull image:

```
sudo docker pull zcalusic/geth
```

Run Ethereum full node in Kubernetes:

```
apiVersion: v1
kind: Service
metadata:
  name: ethereum
spec:
  selector:
    app: ethereum
  type: ClusterIP
  clusterIP: 10.97.0.1
  ports:
  - name: http-rpc
    protocol: TCP
    port: 8545
    targetPort: 8545
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ethereum
spec:
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: ethereum
  template:
    metadata:
      labels:
        app: ethereum
    spec:
      terminationGracePeriodSeconds: 300
      containers:
      - name: geth
        image: zcalusic/geth
        securityContext:
          runAsUser: 1000
          runAsGroup: 1000
        command:
        - geth
        - --datadir=/home/ethereum/geth
        - --http
        - --http.addr=0.0.0.0
        - --http.vhosts=*
        ports:
        - name: discovery
          containerPort: 30303
          protocol: UDP
          hostPort: 30303
        - name: p2p
          containerPort: 30303
          protocol: TCP
          hostPort: 30303
        volumeMounts:
        - name: ethereum-data
          mountPath: /home/ethereum
        - name: ethereum-ancient-data
          mountPath: /home/ethereum/geth/geth/chaindata/ancient
        env:
        - name: TZ
          value: Europe/Zagreb
      - name: prysm
        image: zcalusic/prysm
        securityContext:
          runAsUser: 1000
          runAsGroup: 1000
        command:
        - beacon-chain
        - --accept-terms-of-use
        - --datadir=/home/ethereum/prysm
        - --jwt-secret=/home/ethereum/geth/geth/jwtsecret
        ports:
        - name: discovery
          containerPort: 12000
          protocol: UDP
          hostPort: 12000
        - name: p2p
          containerPort: 13000
          protocol: TCP
          hostPort: 13000
        volumeMounts:
        - name: ethereum-data
          mountPath: /home/ethereum
        env:
        - name: TZ
          value: Europe/Zagreb
      volumes:
      - name: ethereum-data
        hostPath:
          path: /home/ethereum
          type: Directory
      - name: ethereum-ancient-data
        hostPath:
          path: /storage/ancient
          type: Directory
```

Build image:

```
sudo make docker_build
```
