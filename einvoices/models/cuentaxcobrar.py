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

class CuentaxCobrar(Base):
    __tablename__ = 'cuentasxcobrar'
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
    company_id = Column(Integer,ForeignKey('companies.id'))
    tenant_id = Column(String(5))
    
    #relationships
    company = relationship("Company", foreign_keys=[company_id], backref=backref('clients', order_by=id))
    

