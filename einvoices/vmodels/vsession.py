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
class vSession(Base):
    __tablename__ = 'vsessions'
    session_id = Column(String(20), primary_key=True)
    data = Column(String(500))
    date = Column(String(100))
    expiration = Column(String(100))
