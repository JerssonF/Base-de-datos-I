from fastapi import FastAPI, HTTPException, Depends, status
from pydantic import BaseModel
from typing import Annotated
import models
from database import engine, SessionLocal
from sqlalchemy.orm import Session

app = FastAPI()

class IngresoBase(BaseModel):
    Catalinausuario:str
    Catalinadocumento:str
    Catalinacolegio:str
    Catalinaprofesor:str
    Catalinagrado:int
    Catalinamateria:str
    Catalinanota:str
class IngresoBase2(BaseModel):
    Catalinaid:int
    Catalinausuario:str
    Catalinadocumento:str
    Catalinacolegio:str
    Catalinaprofesor:str
    Catalinagrado:int
    Catalinamateria:str
    Catalinanota:str
def get_db():
    db=SessionLocal()
    try:
        yield db
    finally:
        db.close()
        
db_dependency= Annotated[Session, Depends(get_db)]

@app.post("/registro/", status_code=status.HTTP_201_CREATED)
async def crear_registro(registro:IngresoBase, db:db_dependency):
    db_registro = models.Ingreso(**registro.dict())
    db.add(db_registro)
    db.commit()
    return "El registro se realizó exitosamente."

@app.get("/listar/", status_code=status.HTTP_200_OK)
async def listar_usuarios(db:db_dependency):
    registros = db.query(models.Ingreso).all()
    return registros

@app.get("/consultar/{Catalinaid}", status_code=status.HTTP_200_OK)
async def listar_id(Catalinaid, db:db_dependency):
    registro=db.query(models.Ingreso).filter(models.Ingreso.Catalinaid==Catalinaid).first()
    if registro is None:
        HTTPException(status_code=404, detail="Registro no existe")
    return registro
    
@app.delete("/borrarregistro/{Catalinaid}", status_code=status.HTTP_200_OK)
async def borrar_registro(Catalinaid, db:db_dependency):
    registroborrar = db.query(models.Ingreso).filter(models.Ingreso.Catalinaid==Catalinaid).first()
    if registroborrar is None:
        HTTPException(status_code=404, detail="Registro no se puede borrar, no existe id")
    db.delete(registroborrar)
    db.commit()
    return "El registro se eliminó exitosamente"

@app.post("/actualizarregistro/", status_code=status.HTTP_200_OK)
async def actualizar_registro(registro:IngresoBase2, db:db_dependency):
    registroactualizar = db.query(models.Ingreso).filter(models.Ingreso.Catalinaid==registro.Catalinaid).first()
    if registroactualizar is None:
        HTTPException(status_code=404, detail="No se encuentra el registro")
    registroactualizar.Catalinausuario=registro.Catalinausuario
    registroactualizar.Catalinadocumento=registro.Catalinadocumento
    registroactualizar.Catalinacolegio=registro.Catalinacolegio
    registroactualizar.Catalinaprofesor=registro.Catalinaprofesor
    registroactualizar.Catalinagrado=registro.Catalinagrado
    registroactualizar.Catalinamateria=registro.Catalinamateria
    registroactualizar.Catalinanota=registro.Catalinanota
    db.commit()
    return " Registro actualizado exitosamente"
    