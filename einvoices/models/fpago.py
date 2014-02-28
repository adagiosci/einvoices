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

class FPagos(Base):
    __tablename__ = 'FPago'
    id = Column(Integer, primary_key=True)
    Clave = Column(String(50))
    Descripcion = Column(String(50))
    Tipo = Column(String(50))
    Moneda = Column(String(50))
    id_Empresa = Column(Integer,ForeignKey('companies.id'))
    tenant_id = Column(String(5))
    
    #relationships
    company = relationship("Company", foreign_keys=[idcompany], backref=backref('clients', order_by=id))
    

