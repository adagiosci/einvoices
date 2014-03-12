from pyramid.config import Configurator
from sqlalchemy import engine_from_config
from pyramid.authentication import AuthTktAuthenticationPolicy
from pyramid.authorization import ACLAuthorizationPolicy

from models.meta import (
    DBSession,
    Base
    )
from views.unidades import ProjectorUnidades     
from views.companies import  ProjectorCompanies
from views.home import  ProjectorHome
from views.users import ProjectorUsers
from views.clientes import ProjectorClientes
from views.suppliers import ProjectorSuppliers
from views.sucursales import ProjectorSucursales
from views.monedas import ProjectorMonedas
from views.bancos import ProjectorBancos
from views.cuentasbanc import ProjectorCuentasBancarias
from views.main import Main
from einvoices.models.RootFactory import RootFactory, groupfinder


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    
    authn_policy = AuthTktAuthenticationPolicy('session_id', 
        callback=groupfinder
    )
    authz_policy = ACLAuthorizationPolicy()
    
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)
    Base.metadata.bind = engine
    config = Configurator(
        settings=settings,
        root_factory=RootFactory,
        authentication_policy=authn_policy,
        authorization_policy=authz_policy,
    )
    #config.scan()
    config.include('pyramid_handlers')
    config.include('pyramid_chameleon')
    config.add_static_view('static', 'static', cache_max_age=3600)
    
    #login URL's
    config.add_handler('main_login', '/main/login', handler= Main, action='login')
    config.add_handler('main_logout', '/main/logout', handler= Main, action='logout')
    #home URL's
    config.add_handler('home', '/', handler= ProjectorHome, action='index')
    
    #users URL's
    config.add_handler('users_index','/users', handler = ProjectorUsers, action='index')
    config.add_handler('users_indexm','/users/m={m}', handler = ProjectorUsers, action = 'index')
    config.add_handler('users_indexe', '/users/e={e}', handler = ProjectorUsers, action = 'index')
    config.add_handler('users_action','/users/{action}', handler = ProjectorUsers)
    config.add_handler('users_action_id','/users/{action}/{id}', handler = ProjectorUsers)
    
    #clients URL's
    config.add_handler('clients_index','/clients', handler = ProjectorClientes, action='index')
    config.add_handler('clients_indexm','/clients/m={m}', handler = ProjectorClientes, action = 'index')
    config.add_handler('clients_indexe', '/clients/e={e}', handler = ProjectorClientes, action = 'index')
    config.add_handler('clients_action','/clients/{action}', handler = ProjectorClientes)
    config.add_handler('clients_action_id','/clients/{action}/{id}', handler = ProjectorClientes)
    
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
    
    #suppliers URL's
    #companies URL's
    config.add_handler('suppliers_index', '/suppliers', handler= ProjectorSuppliers, action='index')
    config.add_handler('suppliers_indexm', '/suppliers/m={m}', handler= ProjectorSuppliers, action='index') 
    config.add_handler('suppliers_indexe', '/suppliers/e={e}', handler= ProjectorSuppliers, action='index')
    config.add_handler('suppliers_action', '/suppliers/{action}', handler= ProjectorSuppliers)
    config.add_handler('suppliers_action_id', '/suppliers/{action}/{id}', handler= ProjectorSuppliers)
    
    #sucursales
    config.add_handler('sucursales_index', '/sucursales', handler= ProjectorSucursales, action='index')
    config.add_handler('sucursales_indexm', '/sucursales/m={m}', handler= ProjectorSucursales, action='index') 
    config.add_handler('sucursales_indexe', '/sucursales/e={e}', handler= ProjectorSucursales, action='index')    
    config.add_handler('sucursales_action', '/sucursales/{action}', handler= ProjectorSucursales)
    config.add_handler('sucursales_action_id', '/sucursales/{action}/{id}', handler= ProjectorSucursales)

    #monedas
    config.add_handler('monedas_index', '/monedas', handler= ProjectorMonedas, action='index')
    config.add_handler('monedas_indexm', '/monedas/m={m}', handler= ProjectorMonedas, action='index') 
    config.add_handler('monedas_indexe', '/monedas/e={e}', handler= ProjectorMonedas, action='index')    
    config.add_handler('monedas_action', '/monedas/{action}', handler= ProjectorMonedas)
    config.add_handler('monedas_action_id', '/monedas/{action}/{id}', handler= ProjectorMonedas)

    #bancos
    config.add_handler('bancos_index', '/bancos', handler= ProjectorBancos, action='index')
    config.add_handler('bancos_indexm', '/bancos/m={m}', handler= ProjectorBancos, action='index') 
    config.add_handler('bancos_indexe', '/bancos/e={e}', handler= ProjectorBancos, action='index')    
    config.add_handler('bancos_action', '/bancos/{action}', handler= ProjectorBancos)
    config.add_handler('bancos_action_id', '/bancos/{action}/{id}', handler= ProjectorBancos) 

    #cuenta bancaria
    config.add_handler('cuentabanc_index', '/cuentasbancarias', handler= ProjectorCuentasBancarias, action='index')
    config.add_handler('cuentabanc_indexm', '/cuentasbancarias/m={m}', handler= ProjectorCuentasBancarias, action='index') 
    config.add_handler('cuentabanc_indexe', '/cuentasbancarias/e={e}', handler= ProjectorCuentasBancarias, action='index')    
    config.add_handler('cuentabanc_action', '/cuentasbancarias/{action}', handler= ProjectorCuentasBancarias)
    config.add_handler('cuentabanc_action_id', '/cuentasbancarias/{action}/{id}', handler= ProjectorCuentasBancarias)          
       
    return config.make_wsgi_app()
