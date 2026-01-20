# Imagen base
FROM python:3.11-slim

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos las dependencias de la app
COPY requirements.txt .

# Comando para copiar las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el código del script
COPY scripts/ ./scripts/

# Exponemos el puerto local para correr la app
EXPOSE 8000

# Comando por defecto al ejecutar el contenedor
CMD ["uvicorn", "scripts.main:app", "--host", "0.0.0.0", "--port", "8000"]
