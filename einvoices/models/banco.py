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

class Banco(Base):
    __tablename__ = 'bancos'
    id = Column(Integer, primary_key=True)
    Clave = Column(String(50))
    Nombre = Column(String(100))
    Sucursal = Column(String(100))
    Direccion = Column(String(200))
    Telefono = Column(String(20))
    Estatus = Column(String(20),default='Active')
    company_id = Column(Integer,ForeignKey('companies.id'))
    
    #relationships
    company = relationship("Company", foreign_keys=[company_id], backref=backref('clients', order_by=id))
    

