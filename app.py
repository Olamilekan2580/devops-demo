from fastapi import FastAPI, Response

app = FastAPI(title="DevSecOps Demo API")

@app.get("/")
def read_root():
    return {"status": "success", "message": "Welcome to the Secured Portfolio API endpoint!"}

@app.get("/health", status_code=200)
def health_check(response: Response):
    # Add custom security/info headers
    response.headers["X-Portfolio-Status"] = "Secured-by-Trivy"
    return {"status": "healthy"}
