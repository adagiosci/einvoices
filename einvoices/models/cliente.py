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
class Cliente(Base):
    __tablename__ = 'Cliente'
    id = Column(Integer, primary_key=True)
    RFC = Column(String(20))
    RazonSocial = Column(String(100))
    Direccion = Column(String(100))
    id_Empresa = Column(Integer)
    id_Sucursal = Column(Integer)

