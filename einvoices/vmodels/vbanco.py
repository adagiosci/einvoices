from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    String,
    ForeignKey,
    )

from .meta import (
	vBase,
	vDBSession,
)
from sqlalchemy.orm import relationship, backref

class vBanco(vBase):
    __tablename__ = 'vbancos'
    id = Column(Integer, primary_key=True)
    Clave = Column(String(50))
    Nombre = Column(String(100))
    Sucursal = Column(String(100))
    Direccion = Column(String(200))
    Telefono = Column(String(20))
    Estatus = Column(String(20))
    company_id = Column(Integer,ForeignKey('vcompanies.id'))
    tenant_id = Column(String(5))
    
    #relationships
    company = relationship("vCompany", foreign_keys=[idcompany], backref=backref('vclients', order_by=id))
    

