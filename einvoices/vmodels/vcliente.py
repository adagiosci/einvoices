from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    String,
    ForeignKey,
    )

from .vmeta import (
	vBase,
	vDBSession,
)
from sqlalchemy.orm import relationship, backref

class vCliente(Base):
    __tablename__ = 'vclientes'
    id = Column(Integer, primary_key=True)
    RFC = Column(String(20))
    RazonSocial = Column(String(100))
    Direccion = Column(String(100))
    idcompany = Column(Integer,ForeignKey('vcompanies.id'))
    id_Sucursal = Column(Integer,ForeignKey('vsucursales.id'))
    
    #relationships
    company = relationship("vCompany", foreign_keys=[idcompany], backref=backref('vclients', order_by=id))
    sucursal = relationship("vSucursal", foreign_keys=[id_Sucursal], backref=backref('vsucursales', order_by=id))

