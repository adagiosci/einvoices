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

class vCuentaxCobrar(vBase):
    __tablename__ = 'vcuentasxcobrar'
    id = Column(Integer, primary_key=True)
    Folio = Column(String(20))
    Cliente = Column(String(100))
    Factura = Column(String(20))
    Fecha = Column(String(100)) #datetime
    Monto = Column(Float)
    Saldo = Column (Float)
    Tipo = Column(String(20))
    Observaciones = Column(String(300))
    Estatus = Column(String(20))
    id_Movimiento = #relacion con bancos
    company_id = Column(Integer,ForeignKey('vcompanies.id'))
    tenant_id = Column(String(5))
    
    #relationships
    company = relationship("vCompany", foreign_keys=[idcompany], backref=backref('vclients', order_by=id))
    

