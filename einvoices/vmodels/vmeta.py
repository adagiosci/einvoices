from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import (
    scoped_session,
    sessionmaker,
    )
#pasando esto por parametro ya no es necesario hacer un commit (vDBSession.commit()) al finalizar cada transaccion
from zope.sqlalchemy import ZopeTransactionExtension

vDBSession = scoped_session(sessionmaker(extension=ZopeTransactionExtension()))
vBase = declarative_base()