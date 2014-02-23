from sqlalchemy import engine_from_config
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import (
    scoped_session,
    sessionmaker,
    )

def MakeEngine():
   # vars for the connection url
   username = 'HfPf2'
   password = 'SVaAlnR781'
   host = 'localhost'
   port = '5432'
   database = 'einvoices'
 
   # specify the url (and other settings if we had them)
   settings = {
         'url': 'mysql://%s:%s@%s/%s' % (username, password, host, database)
         }
 
   # actually create the engine with the sqlalchemy factory method
   return engine_from_config(settings, prefix='')

#from zope.sqlalchemy import ZopeTransactionExtension
#DBSession = scoped_session(sessionmaker(extension=ZopeTransactionExtension()))
engine = MakeEngine() 
vBase = declarative_base()
vBase.metadata.drop_all(engine)
vBase.metadata.create_all(engine)
createSession = sessionmaker(bind=engine)
vDBSession = createSession()