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

class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    email = Column(String(45))
    password = Column(String(45))
    first_name = Column(String(100))
    second_name = Column(String(100))
    last_name = Column(String(100))
    mother_name = Column(String(100))
