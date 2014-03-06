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
class Permission(Base):
    __tablename__ = 'permissions'
    id = Column(Integer, primary_key=True)
    user_id = Column(Integer,ForeignKey('users.id'))
    permission = Column(String(45))
    value = Column(Integer)

    user = relationship("User", foreign_keys=[user_id] ,backref=backref('users', order_by=id)) #many to one relationship
