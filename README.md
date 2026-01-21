# Demo de Infraestructura DevOps — GCP + Terraform + GKE + Docker + CI/CD

## 📌 Resumen

Este repositorio contiene la definición de **Infraestructura como Código (IaC)** y un flujo DevOps completo para desplegar aplicaciones en **Google Cloud Platform (GCP)** usando **Terraform**, **Docker**, **Kubernetes** y **GitLab CI/CD**.  

Incluye:  
- Aprovisionamiento de VM bastión y cluster GKE  
- Entorno Kubernetes operativo con nodos listos  
- Aplicación Dockerizada (FastAPI) con sus dependencias (`requirements.txt`)  
- Pipeline CI/CD para pruebas y construcción de imágenes  

Este proyecto sirve como **laboratorio DevOps** para demostrar conocimientos de infraestructura, contenedores y despliegue automatizado.

---

## 🏗️ Arquitectura

**Componentes principales:**

- **Terraform**
  - Aprovisiona todos los recursos de infraestructura de manera declarativa
- **VM de Compute Engine**
  - Bastión DevOps con Docker, gcloud y kubectl
- **Cluster GKE**
  - Cluster de Kubernetes administrado por GCP
- **Docker**
  - Aplicación FastAPI contenedorizada
  - Gestión de dependencias con `requirements.txt`:
    ```text
    fastapi
    uvicorn
    pydantic
    ```
- **GitLab CI/CD**
  - Pipeline con stages de `test` y `build`  
  - Construcción de la imagen Docker y validación de scripts Python  

---

## 🔧 Docker y Pipeline CI/CD

**Dockerfile:**  
- Construye la aplicación FastAPI dentro de un contenedor  
- Instala dependencias de Python desde `requirements.txt`  

**GitLab CI/CD (`.gitlab-ci.yml`):**
```yaml
stages:
  - test
  - build

variables:
  IMAGE_NAME: devops-trainee-lab

test_python:
  stage: test
  image: python:3.11
  script:
    - pip install -r requirements.txt
    - python scripts/main.py

build_docker:
  stage: build
  image: docker:24
  services:
    - docker:24-dind
  variables:
    DOCKER_TLS_CERTDIR: ""
  script:
    - docker build -t $IMAGE_NAME .
```
- Validación de Python antes de construir la imagen
- Construcción de la imagen Docker lista para desplegar en Kubernetes


## ☁️ Recursos aprovisionados

### Google Compute Engine

- Instancia bastión DevOps con:

    - Ubuntu LTS
    - Docker y gcloud instalados
    - kubectl funcional

### Google Kubernetes Engine (GKE)

- Cluster cluster-1 con nodos listos (Ready)

- Contexto configurado automáticamente con gke-gcloud-auth-plugin

### Kubernetes

- Despliegue de contenedores FastAPI
- Servicio tipo LoadBalancer expuesto públicamente
- Validación con:

```bash
kubectl get nodes
kubectl get services
curl http://<IP_EXTERNA>
```

## 🔐 Autenticación y acceso

- Credenciales obtenidas con:

```bash
gcloud container clusters get-credentials cluster-1 \
  --zone us-central1-a \
  --project <ID_DEL_PROYECTO>
```

- El contexto queda en ~/.kube/config
- kubectl listo para interactuar con el cluster

## 🚀 Estado del despliegue

- VM bastión creada con Docker y herramientas DevOps
- Cluster Kubernetes operativo
- Servicio de FastAPI accesible públicamente
- Pipeline CI/CD funcionando y validado

## 📚 Objetivos de aprendizaje

- Infraestructura como Código con Terraform
- Dockerización de aplicaciones Python/FastAPI
- Kubernetes: despliegue, servicio y nodos
- CI/CD con GitLab: pruebas y build de contenedores
- Networking y exposición de servicios

## ⚠️ Alcance y notas

- Laboratorio de aprendizaje, no listo para producción
- No incluye hardening de seguridad, monitoreo ni escalamiento automático
- Pipeline simple para validar conceptos básicos
