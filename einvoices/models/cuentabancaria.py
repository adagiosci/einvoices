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

class CuentaBancaria(Base):
    __tablename__ = 'CuentasBancarias'
    id = Column(Integer, primary_key=True)
    Cuenta = Column(String(100))
    Titular = Column(String(200))
    CLABE = Column(String(200))
    Tipo = Column(String(100))
    Observaciones = Column(String(300))
    Estatus = Column(String(20))
    Saldo = Column (Float)
    id_Banco = #relacion con bancos
    company_id = Column(Integer,ForeignKey('companies.id'))
    tenant_id = Column(String(5))
    
    #relationships
    company = relationship("Company", foreign_keys=[idcompany], backref=backref('clients', order_by=id))
    

