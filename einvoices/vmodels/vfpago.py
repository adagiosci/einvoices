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

class vFPagos(vBase):
    __tablename__ = 'vFPago'
    id = Column(Integer, primary_key=True)
    Clave = Column(String(50))
    Descripcion = Column(String(50))
    Tipo = Column(String(50))
    Moneda = Column(String(50))
    id_Empresa = Column(Integer,ForeignKey('vcompanies.id'))
    tenant_id = Column(String(5))
    
    #relationships
    company = relationship("vCompany", foreign_keys=[idcompany], backref=backref('vclients', order_by=id))
    

