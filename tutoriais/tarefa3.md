
# 🚀 Tarefa 3 — Gerenciamento de Pods e Nodes em Cluster Kubernetes

## 📋 Descrição das Etapas

1. **Realizar o deployment de um aplicativo no cluster usando YAML**
2. **Identificar em qual node o pod está sendo executado**
3. **Tornar o node indisponível**
4. **Observar o comportamento da aplicação e o realocamento dos pods**
5. **Restabelecer o node original**

---

## 📁 Estrutura de Diretórios

```
.
├── cluster.yaml        # Configuração do cluster KIND
├── deployment.yaml     # Arquivo de deployment do app
```

---

## 🧱 1. Subir o Cluster e Aplicar o Deployment

```bash
kind create cluster --config=cluster.yaml
kubectl apply -f deployment.yaml
```

---

## 🔍 2. Verificar em Qual Node o Pod Está Rodando

```bash
kubectl get pods -o wide
```

> 🔎 Identifique o nome do pod (`deployment-grafa-*`) e observe a coluna **NODE**.

---

## 🚫 3. Tornar o Node Indisponível

Substitua `<nome-do-node>` pelo node identificado no passo anterior.

```bash
kubectl cordon <nome-do-node>
kubectl drain <nome-do-node> --ignore-daemonsets
```

---

## 👀 4. Observar o Comportamento da Aplicação

Verifique novamente onde o pod foi alocado:

```bash
kubectl get pods -o wide
```

> O pod deve ser reprogramado automaticamente para outro node disponível.

---

## ♻️ 5. Restabelecer o Node

```bash
kubectl uncordon <nome-do-node>
```
