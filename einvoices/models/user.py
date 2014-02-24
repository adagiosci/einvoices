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
class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    email = Column(String(45))
    password = Column(String(45))
    names = Column(String(100))
    last_name = Column(String(100))
    mother_name = Column(String(100))
    company_id = Column(Integer,ForeignKey('companies.id'))

    company = relationship("Company", foreign_keys=[company_id] ,backref=backref('users', order_by=id)) #many to one relationship
