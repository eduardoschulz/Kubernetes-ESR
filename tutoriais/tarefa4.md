# 🚀 Tarefa 2 — Cluster Kubernetes com Imagem Customizada
## 📋 Descrição

1. **Fazer deployment de um app no cluster usando yaml**
2. **Identificar em que node está sendo executado**
3. **Deixar o node acima indisponível**
4. **Observar o comportamento da aplicação, ver para qual node ela foi alocada**
5. **Restabelecer o node**

---

## 📁 Estrutura de Diretórios

```
├── cluster.yaml  #Arquivos de configuração do cluster e do deployment
└── deployment.yaml
```

---
### 📦 Fazer deployment no cluster

```bash
kind create cluster --config=cluster.yaml #para subir o cluster
kubectl apply -f src/deployment.yaml #para subir o deployment
```

### Identificar em que node está sendo executado
```bash
kubectl get pod deployment-grafa-* -o wide
```

### Deixar o node acima indisponível
```bash
kubectl cordon cluster-esr-worker2 #vai tirar ele do scheduling, ou seja, nao vai receber mais deployments
kubectl drain cluster-esr-worker2 --ignore-daemonsets #vai drenar os pods restantes do node
```

### Observar o comportamento da aplicação, ver para qual node ela foi alocada
```bash
kubectl get pod deployment-grafa-* -o wide
```
### Restabelecer o node
```bash
kubectl uncordon cluster-esr-worker2
```
---

