# 🚀 Tarefa 2 — Cluster Kubernetes com Imagem Customizada
## 📋 Descrição

1. **Subir um cluster Kubernetes com 3 nós**
2. **Criar uma imagem Docker customizada**
3. **Enviar essa imagem para o Docker Hub**
4. **Criar um Deployment utilizando essa imagem**
5. **Escalar o Deployment para 4 réplicas**

---

## 📁 Estrutura de Diretórios

```
.
├── imagemcustom/           # Contém a imagem customizada
│   ├── Dockerfile
│   └── entrypoint.sh
├── cluster.yaml  #Arquivos de configuração do cluster e do deployment
└── deployment.yaml
```

---

### 🔨 Build e Push da Imagem

```bash
docker build -t eduardoschulz/alpine-info-server:latest ./imagemcustom
docker push eduardoschulz/alpine-info-server:latest
```

### 📦 Aplicar Configurações no Cluster

```bash
kind create cluster --config=cluster.yaml #para subir o cluster
kubectl apply -f src/deployment.yaml #para subir o deployment
```

---

