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

class vCompany(vBase):
    __tablename__ = 'vcompanies'
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
    
    taxRegime = Column(Integer,ForeignKey('vusers.id'))
    labourSystem = Column(Integer,ForeignKey('vusers.id'))
    financialInformation = Column(Integer,ForeignKey('vusers.id'))
    supervise = Column(Integer,ForeignKey('vusers.id'))
    services = Column(Integer)
    
    #relationships
    #En una relacion one to many  la llave foranea esta en los hijos
    #En una relacion  many to one, la llave foranea esta en los hijos
    
    utaxRegime = relationship("vUser", foreign_keys=[taxRegime], backref=backref('taxRegimes', order_by=id)) #many to one relationship
    ulabourSystem = relationship("vUser", foreign_keys=[labourSystem], backref=backref('labourSystems', order_by=id))
    ufinancialInformation = relationship("vUser", foreign_keys=[financialInformation], backref=backref('financialInformations', order_by=id))
    usupervise = relationship("vUser", foreign_keys=[supervise], backref=backref('supervises', order_by=id))
        
    #units = relationship("Unidad", order_by="Unidad.id", backref="company") one to many relationship

