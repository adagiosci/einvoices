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
    legalRepresentative = Column(String(150))
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
    user = Column(String(5))
    password = Column(String(10))
    tenant_id = Column(String(5))
    group = Column(String(10))
    
    taxRegime = Column(Integer,ForeignKey('users.id'))
    labourSystem = Column(Integer,ForeignKey('users.id'))
    financialInformation = Column(Integer,ForeignKey('users.id'))
    supervise = Column(Integer,ForeignKey('users.id'))
    services = Column(Integer)
    
    #relationships
    #En una relacion one to many  la llave foranea esta en los hijos
    #En una relacion  many to one, la llave foranea esta en los hijos
    
    utaxRegime = relationship("User", foreign_keys=[taxRegime], backref=backref('taxRegimes', order_by=id)) #many to one relationship
    ulabourSystem = relationship("User", foreign_keys=[labourSystem], backref=backref('labourSystems', order_by=id))
    ufinancialInformation = relationship("User", foreign_keys=[financialInformation], backref=backref('financialInformations', order_by=id))
    usupervise = relationship("User", foreign_keys=[supervise], backref=backref('supervises', order_by=id))
        
    #units = relationship("Unidad", order_by="Unidad.id", backref="company") one to many relationship

