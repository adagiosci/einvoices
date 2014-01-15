from pyramid.config import Configurator
from sqlalchemy import engine_from_config

from models.meta import (
    DBSession,
    Base
    )
from views.unidades import ProjectorUnidades     
from views.companies import  ProjectorCompanies
from views.home import  ProjectorHome
from views.users import ProjectorUsers

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
    
    #home URL's
    config.add_handler('home', '/', handler= ProjectorHome, action='index')
    
    #users URL's
    config.add_handler('users_index','/users', handler = ProjectorUsers, action='index')
    config.add_handler('users_indexm','/users/m={m}', handler = ProjectorUsers, action = 'index')
    config.add_handler('users_indexe', '/users/e={e}', handler = ProjectorUsers, action = 'index')
    config.add_handler('users_action','/users/{action}', handler = ProjectorUsers)
    config.add_handler('users_action_id','/users/{action}/{id}', handler = ProjectorUsers)
    
    #companies URL's
    config.add_handler('companies_index', '/companies', handler= ProjectorCompanies, action='index')
    config.add_handler('companies_indexm', '/companies/m={m}', handler= ProjectorCompanies, action='index') 
    config.add_handler('companies_indexe', '/companies/e={e}', handler= ProjectorCompanies, action='index')
    config.add_handler('companies_action', '/companies/{action}', handler= ProjectorCompanies)
    config.add_handler('companies_action_id', '/companies/{action}/{id}', handler= ProjectorCompanies)
    
    #unidades URL's
    config.add_handler('unidades_index','/unidades', handler = ProjectorUnidades, action='index')
    config.add_handler('unidades_indexm','/unidades/m={m}', handler = ProjectorUnidades, action = 'index')
    config.add_handler('unidades_indexe', '/unidades/e={e}', handler = ProjectorUnidades, action = 'index')
    config.add_handler('unidades_action','/unidades/{action}', handler = ProjectorUnidades)
    config.add_handler('unidades_action_id','/unidades/{action}/{id}', handler = ProjectorUnidades)
       
    return config.make_wsgi_app()
