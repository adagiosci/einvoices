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

class vAerolinea(vBase):
    __tablename__ = 'aerolineas'
    idaerolinea = Column(Integer, primary_key=True)
    Cod_iata = Column(Text)
    Nombre_general = Column(Text)
    Cod_oaci = Column(Text)
    direccion_general = Column(Text)
    estado = Column(Text)
    telefono_general = Column(Text)
    nombre_contacto = Column(Text)
    telefono_contacto = Column(Text)
    email_contacto = Column(Text)
    direccion_contacto = Column(Text)
    direccion_facturacion = Column(Text)
    telefono_facturacion = Column(Text)
    email_facturacion = Column(Text)
    vigencia_inicia = Column(Text)
    vigencia_finaliza = Column(Text)
    Nombre_facturacion = Column(Text)
    contrato = Column(Text)
    rampa = Column(Text)
    servicio = Column(Text)
    despacho = Column(Text)
    mantenimiento = Column(Text) 