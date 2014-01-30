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

class Company(Base):
    __tablename__ = 'companies'
    id = Column(Integer, primary_key=True)
    name = Column(String(150))
    rfc = Column(String(45))
    address = Column(String(250))
    cp = Column(String(10))
    corporateName = Column(String(100))
    curp = Column(String(45))
    telephone = Column(String(15))
    positionlegalRepresentative = Column(String(200))
    rfcLegalRepresentative = Column(String(20))
    curpLegalRepresentative = Column(String(20))
    idLegalRepresentative = Column(String(50))
    emailLegalRepresentative = Column(String(70))
    datasLegalRepresentative = Column(String(500))
    ciecKey = Column(String(250))
    fielKey = Column(String(200))
    imssKey = Column(String(200))
    digitalSignature = Column(String(250))
    accountNumber = Column(String(40))
    start_date = Column(String(10))
    end_date = Column(String(10))
    
    #units = relationship("Unidad", order_by="Unidad.id", backref="company") relacion uno a muchos

