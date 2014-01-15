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

class User_Company(Base):
	__tablename__ = 'users_companies'
	id = Column(Integer, primary_key=True)
	iduser = (Integer)
	idcompany = (Integer)
