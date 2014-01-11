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

class Company(Base):
    __tablename__ = 'companies'
    id = Column(Integer, primary_key=True)
    name = Column(String(150))
    rfc = Column(String(45))
    address = Column(String(250))
    cp = Column(String(10))
    corporateName = Column(String(100))
    curp = Column(String(45))
