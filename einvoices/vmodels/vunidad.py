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

#ALTER TABLE  `unidades` ADD FOREIGN KEY (  `idcompany` ) REFERENCES  `einvoices`.`companies` (
#`id`
#) ON DELETE RESTRICT ON UPDATE CASCADE ;

class vUnidad(vBase):
	__tablename__ = 'vunidades'
	id = Column(Integer, primary_key=True)
	clave = Column(String(20))
	description = Column(Text)
	idcompany = Column(Integer,ForeignKey('vcompanies.id'))
	company = relationship("vCompany", backref=backref('vunits', order_by=id)) #one to one relationship

