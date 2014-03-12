from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
import webhelpers.paginate
from layouts import Layouts
from main import Main
#from einvoices.library.main import (
	#main,
#)
BASE_TMPL = 'einvoices:templates/'

from sqlalchemy.exc import DBAPIError

from einvoices.models.user import User
from einvoices.models.cuentabancaria import CuentaBancaria 
from einvoices.models.banco import Banco  
from einvoices.models.company import (
    DBSession,
    )

class ProjectorCuentasBancarias(Main):
	def __init__(self, request):
		self.DBSession = DBSession
		self.tUser = User
		self.config_view_name = 'cuentas'
		super(ProjectorCuentasBancarias,self).__init__(request)
		
	@action(renderer=BASE_TMPL  + "cuentasbancarias/index.pt")
	def index(self):
		msj = self.message();
		entries = self.DBSession.query(CuentaBancaria).filter_by(company_id = self.__current_company__.id)
		bancos = self.DBSession.query(Banco).filter_by(company_id = self.__current_company__.id)
		pages = webhelpers.paginate.Page(entries, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		return {'cuentas':pages,'bancos':bancos,'msj':msj,'pagination':_pagination}
		
	@action(renderer=BASE_TMPL  + "cuentasbancarias/edit.pt")
	def edit(self):
		msj = self.message();
		id = self.request.matchdict['id']
		entries = self.DBSession.query(CuentaBancaria).filter_by(company_id = self.__current_company__.id)
		bancos = self.DBSession.query(Banco).filter_by(company_id = self.__current_company__.id)
		pages = webhelpers.paginate.Page(entries, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		entry = self.DBSession.query(CuentaBancaria).filter_by(id=id,company_id = self.__current_company__.id).first()
		return {'entry':entry,'cuentas':pages,'bancos':bancos,'msj':msj,'pagination':_pagination}
	
	@action(renderer=BASE_TMPL  + "cuentasbancarias/list.pt")
	def filter(self):
		companies = self.DBSession.query(self.tCompany)
		page = webhelpers.paginate.Page(companies, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(page)
		return {'companies':page,'pagination':_pagination}
	
	@reify
	def cuentasbancarias_list(self):
		renderer = get_renderer(BASE_TMPL  + "cuentasbancarias/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		banco = CuentaBancaria(
				 Cuenta = self.request.POST['Cuenta']
				,banco_id = self.request.POST['banco_id']
				,Titular = self.request.POST['Titular']
				,CLABE = self.request.POST['CLABE']
				,Tipo = self.request.POST['Tipo']
				,Observaciones = self.request.POST['Observaciones']
				,Saldo = self.request.POST['Saldo']
				,company_id = self.__current_company__.id
			)
		self.DBSession.add(banco)
		return HTTPFound(location='/cuentasbancarias/m=ric')
		
	@action()
	def update(self):
		banco = self.DBSession.query(CuentaBancaria).filter_by(id=self.request.POST['entry_id'],company_id = self.__current_company__.id).update({
													 'Cuenta':self.request.POST['Cuenta']
													,'banco_id':self.request.POST['banco_id']
													,'Titular':self.request.POST['Titular']
													,'CLABE':self.request.POST['CLABE']
													,'Tipo':self.request.POST['Tipo']
													,'Observaciones':self.request.POST['Observaciones']
													,'Saldo' : self.request.POST['Saldo']
													})
		return HTTPFound(location='/cuentasbancarias/m=rec')
	
	@action()
	def delete(self):
		id = self.request.matchdict['id'] 
		banco = self.DBSession.query(CuentaBancaria).filter_by(id=id,company_id = self.__current_company__.id).delete()
		return HTTPFound(location='/cuentasbancarias/m=rdc')
				