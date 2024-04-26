from sqlalchemy import String, Integer, Column
from database import Base

class Ingreso(Base):
    __tablename__= "asignaturas"
    Catalinaid = Column(Integer, primary_key=True, index=True)
    Catalinausuario = Column(String(100))
    Catalinadocumento = Column(String(25))
    Catalinacolegio= Column(String(100))
    Catalinaprofesor = Column(String(150))
    Catalinagrado = Column(Integer)
    Catalinamateria = Column(String(30))
    Catalinanota = Column(String(20))
