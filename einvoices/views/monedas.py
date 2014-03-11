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
from einvoices.models.currency import Currency 
from einvoices.models.sucursal import Sucursal  
from einvoices.models.company import (
    DBSession,
    Company,
    )

class ProjectorMonedas(Main):
	def __init__(self, request):
		self.DBSession = DBSession
		self.tUser = User
		self.tSucursal = Sucursal
		self.tCompany = Company
		self.config_view_name = 'monedas'
		super(ProjectorMonedas,self).__init__(request)
		
	@action(renderer=BASE_TMPL  + "monedas/index.pt")
	def index(self):
		msj = self.message();
		entries = self.DBSession.query(Currency).filter_by(company_id = self.__current_company__.id)
		pages = webhelpers.paginate.Page(entries, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		return {'currencies':pages,'msj':msj,'pagination':_pagination}
		
	@action(renderer=BASE_TMPL  + "monedas/edit.pt")
	def edit(self):
		msj = self.message();
		id = self.request.matchdict['id']
		entries = self.DBSession.query(Currency).filter_by(company_id = self.__current_company__.id)
		pages = webhelpers.paginate.Page(entries, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		entry = self.DBSession.query(Currency).filter_by(id=id,company_id = self.__current_company__.id).first()
		return {'entry':entry,'currencies':pages,'msj':msj,'pagination':_pagination}
	
	@action(renderer=BASE_TMPL  + "monedas/list.pt")
	def filter(self):
		companies = self.DBSession.query(self.tCompany)
		page = webhelpers.paginate.Page(companies, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(page)
		return {'companies':page,'pagination':_pagination}
	
	@reify
	def companies_list(self):
		renderer = get_renderer(BASE_TMPL  + "monedas/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		currency = Currency(
				 name = self.request.POST['name']
				,currency_code = self.request.POST['currency_code']
				,prefix = self.request.POST['prefix']
				,company_id = self.__current_company__.id
			)
		self.DBSession.add(currency)
		return HTTPFound(location='/monedas/m=ric')
		
	@action()
	def update(self):
		currency = self.DBSession.query(Currency).filter_by(id=self.request.POST['entry_id'],company_id = self.__current_company__.id).update({
													 'name': self.request.POST['name']
													,'currency_code': self.request.POST['currency_code']
													,'prefix': self.request.POST['prefix']
													})
		return HTTPFound(location='/monedas/m=rec')
	
	@action()
	def delete(self):
		id = self.request.matchdict['id'] 
		sucursal = self.DBSession.query(Currency).filter_by(id=id,company_id = self.__current_company__.id).delete()
		return HTTPFound(location='/monedas/m=rdc')
				