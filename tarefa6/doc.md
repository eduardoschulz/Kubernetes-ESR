# 🚀 Tarefa 2 — Cluster Kubernetes com Imagem Customizada
## 📋 Descrição

1. **Fazer deployment de um registry**
2. **Configuração de um Service para acessar o Registry fora do cluster**

---

## 📁 Estrutura de Diretórios

```

├── deployments
│   └── registry.yaml
├── kind
│   └── tarefa5.yaml
├── services
│   ├── registry-svc.yml
│   └── svc-trouble.yaml
├── storage
│   └── registry-pvc.yml
└── tarefa6
    └── doc.md

```

---
### 📦 Fazer deployment no cluster

```bash
kind create cluster --config=kind/cluster.yaml #para subir o cluster
kubectl create namespace registry #cria namespace
kubectl apply -f deployments/registry.yaml #sobe deployment
```

### Criar um PersistantVolumeClaim

```bash
kubectl apply -f storage/registry-pvc.yml
```

### Criar um Service para acesso do Registry
```bash
kubectl apply -f services/registry-svc.yml
```
---

