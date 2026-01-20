from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"status": "ok", "message": "DevOps Trainee Lab running"}

@app.get("/health")
def health_check():
    return {"status": "healthy"}
