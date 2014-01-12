from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    String,
    )

from .meta import (
	Base,
	DBSession,
)

class Products_Services(Base):
	__tablename__ = 'products_services'
	id = Column(Integer, primary_key=True)
	name = Column(String(100))
	key = Column(String(45))
	price = 
	status = 
	idcompany = 
	idunidad =
	
