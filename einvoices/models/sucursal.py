from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    String,
    ForeignKey,
    )

from .meta import (
	Base,
	DBSession,
)
from sqlalchemy.orm import relationship, backref

class Sucursal(Base):
    __tablename__ = 'sucursales'
    id = Column(Integer, primary_key=True)
    Nombre = Column(String(150))
    Direccion = Column(String(250))
    Correo = Column(String(250))    
    company_id = Column(Integer,ForeignKey('companies.id'))
    
    #relationships
    #En una relacion one to many  la llave foranea esta en los hijos
    #En una relacion  many to one, la llave foranea esta en los hijos
    company = relationship("Company", backref=backref('sucursales', order_by=id)) #many to one relationship

