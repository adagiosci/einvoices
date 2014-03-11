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

#ALTER TABLE  `unidades` ADD FOREIGN KEY (  `idcompany` ) REFERENCES  `einvoices`.`companies` (
#`id`
#) ON DELETE RESTRICT ON UPDATE CASCADE ;

class Unidad(Base):
	__tablename__ = 'unidades'
	id = Column(Integer, primary_key=True)
	clave = Column(String(20))
	description = Column(Text)
	company_id = Column(Integer,ForeignKey('companies.id'))
	company = relationship("Company", backref=backref('units', order_by=id)) #one to one relationship

