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

class Unidad(Base):
	__tablename__ = 'unidades'
	id = Column(Integer, primary_key=True)
	clave = Column(String(20))
	description = Column(Text)
	idcompany = Column(Integer)
