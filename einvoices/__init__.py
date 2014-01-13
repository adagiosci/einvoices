from pyramid.config import Configurator
from sqlalchemy import engine_from_config

from models.meta import (
    DBSession,
    Base
    )

from views.companies import  ProjectorCompanies
from views.home import  ProjectorHome
    
def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)
    Base.metadata.bind = engine
    config = Configurator(settings=settings)
    #config.scan()
    config.include('pyramid_handlers')
    config.include('pyramid_chameleon')
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_handler('home', '/', handler= ProjectorHome, action='index')
    
    #companies URLs
    config.add_handler('companies_index', '/companies', handler= ProjectorCompanies, action='index')
    config.add_handler('companies_create', '/companies/create', handler= ProjectorCompanies, action='create')
    config.add_handler('companies_edit', '/companies/edit/{id}', handler= ProjectorCompanies, action='edit')
    config.add_handler('companies_update', '/companies/update', handler= ProjectorCompanies, action='update')
    config.add_handler('companies_delete', '/companies/delete/{id}', handler= ProjectorCompanies, action='delete')
    #config.add_handler('companies', '/companies/{action}', handler= ProjectorCompanies)
    #config.scan()
    
    return config.make_wsgi_app()
