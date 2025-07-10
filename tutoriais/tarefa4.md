# 🚀 Tarefa 4 - Taints e Constraints 
## 📋 Descrição da Tarefa

Esta tarefa consiste em provisionar um cluster Kubernetes com os seguintes requisitos:

* **3 nós *worker* com hardware de baixa performance (*low*)**
* **2 nós *worker* com hardware de alta performance (*high*)**

Distribuição de serviços:

* **Nginx** será executado nos nós *low*
* **Apache** será executado nos nós *high*

---

## 📁 Estrutura de Diretórios

```
├── cluster.yaml      # Configuração do cluster KIND
└── deployment.yaml   # Manifesto para o deployment dos serviços
```

---

## ⚙️ Provisionamento e Configuração do Cluster

### Criar o Cluster

```bash
kind create cluster --config=kind/tarefa4.yaml
```

### Verificar os Nós

```bash
kubectl get nodes
```

---

## 🏷️ Rotulagem dos Nós

### Atribuir rótulos aos nós de hardware *low*

```bash
kubectl label node cluster-esr-worker hardware=low nodepool=low
kubectl label node cluster-esr-worker2 hardware=low nodepool=low
kubectl label node cluster-esr-worker3 hardware=low nodepool=low
```

### Atribuir rótulos aos nós de hardware *high*

```bash
kubectl label node cluster-esr-worker4 hardware=high nodepool=high
kubectl label node cluster-esr-worker5 hardware=high nodepool=high
```

---

## 🚫 Aplicar *Taints* aos Nós *High*

```bash
kubectl taint node cluster-esr-worker4 critical=true:NoSchedule
kubectl taint node cluster-esr-worker5 critical=true:NoSchedule
```

> ℹ️ Os taints garantem que apenas pods com a devida tolerância sejam agendados nesses nós. Isso assegura que recursos críticos estejam reservados para workloads específicas.

