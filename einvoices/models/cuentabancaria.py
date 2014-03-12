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
    __tablename__ = 'cuentasbancarias'
    id = Column(Integer, primary_key=True)
    Cuenta = Column(String(100))
    Titular = Column(String(200))
    CLABE = Column(String(200))
    Tipo = Column(String(100))
    Observaciones = Column(String(300))
    Estatus = Column(String(20),default='Active')
    Saldo = Column (Float)
    company_id = Column(Integer,ForeignKey('companies.id'))
    banco_id = Column(Integer,ForeignKey('bancos.id'))
    
    #relationships
    company = relationship("Company", foreign_keys=[company_id], backref=backref('cuentas', order_by=id))
    banco = relationship("Banco", foreign_keys=[banco_id], backref=backref('bancos', order_by=id))
    

