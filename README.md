k8s-demo
---

* 實作一個 k8s deployment example
* Use `minikube` for local demo

### Requirement:
* `kubectl`  -> main k8s command
* `minikube` -> for Local k8s env

### file Structure

* `.env` -> 設定檔參數, 請見 `.env.example`

```text
├── Makefile
├── README.md
├── app
│   ├── deployment.yaml
│   └── service.yaml
├── grafana       
│   ├── data-source-config.yaml
│   ├── deployment.yaml
│   └── service.yaml
└── prometheus
    ├── cluster-role.yaml
    ├── config-map.yaml
    ├── deployment.yaml
    └── service.yaml
```
### Commands:

#### CREATE
* `make k8s_apply` : Create Deployment
    * alias: `kubectl apply -f deployment.yaml`
* `make k8s_expose`: Create a service based on Deployment
    * alias: `kubectl apply -f service.yaml`
* `make k8s_geturl`: Get the service URL 

#### TEARDOWN
* `make k8s_destroy`: Delete the Service, then delete deployments
    * `kubectl delete -f service.yaml && kubectl delete -f deployment.yaml`

#### Add Promethues
* 需要下面幾樣東西
* 使用 `namespace=monitoring`

```text
└── prometheus
    ├── cluster-role.yaml
    ├── config-map.yaml
    ├── deployment.yaml      -> Deploy 一個 promethues
    └── service.yaml         -> Expose 一個 Service
```    

* Steps:
    * `kubectl create namespace monitoring` -> Create NameSpace
    * `kubectl create -f prometheus/clusterRole.yaml`
    * `kubectl create -f prometheus/config-map.yaml`
    * `kubectl create -f prometheus/deployment.yaml` -> 建立 deployment
    * `kubectl cteate -f prometheus/service.yaml` -> 建立 Service
    
#### Add Grafana (Monitoring Dashboard)
* 使用 `namespace=monitoring`
* 需要下面幾樣東西
```text
└── grafana       
    ├── data-source-config.yaml
    ├── deployment.yaml
    └── service.yaml
```
* Steps:
   * `kubectl create -f grafana/datasource-config.yaml`
   * `kubectl create -f grafana/deployment.yaml` -> 建立 deployment
   * `kubectl cteate -f grafana/service.yaml` -> 建立 Service

    

