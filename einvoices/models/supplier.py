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

class Supplier(Base):
	__tablename__ = 'suppliers'
	id = Column(Integer, primary_key=True)
	rfc = Column(String(45))
	contacto = Column(String(45))
	noExterior = Column(String(20))	
	colonia = Column(String(45))
	localidad = Column(String(45))
	pais = Column(String(45))
	cp = Column(Integer)
	razonsocial = Column(String(45))
	calle = Column(String(45))
	noInterior = Column(String(20))
	referencia = Column(String(45))
	municipio = Column(String(45))
	estado = Column(String(45))
	email = Column(String(45))
	company_id = Column(Integer,ForeignKey('companies.id'))
	company = relationship("Company", backref=backref('suppliers', order_by=id)) #one to one relationship	
