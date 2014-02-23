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
class vSession(vBase):
    __tablename__ = 'vsessions'
    session_id = Column(String(20), primary_key=True)
    data = Column(String(500))
    date = Column(String(100))
    expiration = Column(String(100))
