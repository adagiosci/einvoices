from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    String,
    ForeignKey,
    )

from .vmeta import (
	vBase,
	vDBSession,
)
from sqlalchemy.orm import relationship, backref
class vUser(vBase):
    __tablename__ = 'vusers'
    id = Column(Integer, primary_key=True)
    email = Column(String(45))
    password = Column(String(45))
    names = Column(String(100))
    last_name = Column(String(100))
    mother_name = Column(String(100))
    company_id = Column(Integer,ForeignKey('vcompanies.id'))

    company = relationship("vCompany", foreign_keys=[company_id] ,backref=backref('users', order_by=id)) #many to one relationship    
