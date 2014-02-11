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

class Cliente(Base):
    __tablename__ = 'clientes'
    id = Column(Integer, primary_key=True)
    RFC = Column(String(20))
    RazonSocial = Column(String(100))
    Direccion = Column(String(100))
    idcompany = Column(Integer,ForeignKey('companies.id'))
    id_Sucursal = Column(Integer,ForeignKey('sucursales.id'))
    
    #relationships
    company = relationship("Company", foreign_keys=[idcompany], backref=backref('clients', order_by=id))
    sucursal = relationship("Sucursal", foreign_keys=[id_Sucursal], backref=backref('sucursales', order_by=id))

