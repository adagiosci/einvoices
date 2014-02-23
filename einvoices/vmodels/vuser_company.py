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

class vUser_Company(Base):
	__tablename__ = 'vusers_companies'
	id = Column(Integer, primary_key=True)
	iduser = (Integer)
	idcompany = (Integer)
