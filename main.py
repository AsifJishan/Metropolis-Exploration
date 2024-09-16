from fastapi import FastAPI
from routes import router
from database import get_session, Base

app = FastAPI()

app.include_router(router)

@app.on_event("startup")
async def startup_event():
    Base.metadata.create_all(bind=get_session().bind)

@app.on_event("shutdown")
async def shutdown_event():
    get_session().close()

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)