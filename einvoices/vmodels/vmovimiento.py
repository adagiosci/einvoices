from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    String,
    Float,
    ForeignKey,
    )

from .meta import (
	vBase,
	vDBSession,
)
from sqlalchemy.orm import relationship, backref

class vMovimiento(vBase):
    __tablename__ = 'vmovimientos'
    id = Column(Integer, primary_key=True)
    Fecha = Column(String(100)) #datetime
    Tipo = Column(String(20))
    Concepto = Column(String(300))
    Monto = Column(Float)
    Observaciones = Column(String(300))
    Estatus = Column(String(20))
    FPago = Column(String(50))
    Bancos = Column(String(100))
    Cuenta = Column(String(100))
    Referencia = Column(String(200))
    Cheque = Column(String(200))
    company_id = Column(Integer,ForeignKey('vcompanies.id'))
    tenant_id = Column(String(5))
    
    #relationships
    company = relationship("vCompany", foreign_keys=[idcompany], backref=backref('vclients', order_by=id))
    

