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
class Currency(Base):
	__tablename__ = 'currencies'
	id = Column(Integer, primary_key=True)
	name = Column(String(100))
	currency_code = Column(String(10))
	prefix = Column(String(10))
	company_id = Column(Integer,ForeignKey('companies.id'))
	company = relationship("Company", backref=backref('currencies', order_by=id)) #one to one relationship

