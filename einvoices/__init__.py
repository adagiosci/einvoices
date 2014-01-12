from pyramid.config import Configurator
from sqlalchemy import engine_from_config

from models.meta import (
    DBSession,
    Base
    )

from views.companies import  ProjectorCompanies    
    
def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)
    Base.metadata.bind = engine
    config = Configurator(settings=settings)
    config.include('pyramid_handlers')
    config.include('pyramid_chameleon')
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_handler('companies', '/companies', handler= ProjectorCompanies, action='index')
    #config.add_handler('companies', '/companies/{action}', handler= ProjectorCompanies)
    #config.scan()
    
    return config.make_wsgi_app()
