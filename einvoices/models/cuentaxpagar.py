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
	Base,
	DBSession,
)
from sqlalchemy.orm import relationship, backref

class CuentaxPagar(Base):
    __tablename__ = 'cuentasxpagar'
    id = Column(Integer, primary_key=True)
    Folio = Column(String(20))
    Cliente = Column(String(100))
    Factura = Column(String(20))
    Fecha = Column(String(100)) #datetime
    Concepto = Column(String(300))
    IVACalculado = Column(Float)
    Subtotal = Column (Float)
    Impuesto = Column (Float)
    Total = Column (Float)
    Estatus = Column(String(20))
    id_Movimiento = #relacion con bancos
    company_id = Column(Integer,ForeignKey('companies.id'))
    tenant_id = Column(String(5))
    
    #relationships
    company = relationship("Company", foreign_keys=[idcompany], backref=backref('clients', order_by=id))
    

