from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    String,
    )

from .vmeta import (
	vBase,
	vDBSession,
)
class vUser(vBase):
    __tablename__ = 'vusers'
    id = Column(Integer, primary_key=True)
    email = Column(String(45))
    password = Column(String(45))
    names = Column(String(100))
    last_name = Column(String(100))
    mother_name = Column(String(100))
