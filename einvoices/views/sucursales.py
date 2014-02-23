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
from einvoices.vmodels.vuser import vUser
from einvoices.vmodels.vsucursal import vSucursal   
from einvoices.vmodels.vcompany import (
    vDBSession,
    vCompany,
    )

from einvoices.models.user import User
from einvoices.models.sucursal import Sucursal   
from einvoices.models.company import (
    DBSession,
    Company,
    )

class ProjectorSucursales(Main):
	def __init__(self, request):
		self.DBSession = vDBSession
		self.tUser = vUser
		self.tSucursal = vSucursal
		self.tCompany = vCompany
		self.config_view_name = 'sucursales'
		super(ProjectorSucursales,self).__init__(request)
		
	@action(renderer=BASE_TMPL  + "sucursales/index.pt")
	def index(self):
		#self.insertdb()
		msj = self.message();
		companies = self.DBSession.query(self.tCompany)
		sucursales = self.DBSession.query(self.tSucursal)
		pages = webhelpers.paginate.Page(sucursales, page=self.request.GET.get('p',1), items_per_page=20)
		users = self.DBSession.query(self.tUser)
		_pagination = self._pagination(pages)
		return {'sucursales':pages,'companies':companies,'msj':msj,'pagination':_pagination}
		
	@action(renderer=BASE_TMPL  + "sucursales/edit.pt")
	def edit(self):
		msj = self.message();
		companies = self.DBSession.query(self.tCompany)
		sucursal_id = self.request.matchdict['id']
		entry = self.DBSession.query(self.tSucursal).filter_by(id=sucursal_id).first()
		sucursales = self.DBSession.query(self.tSucursal)
		pages = webhelpers.paginate.Page(sucursales, page=self.request.GET.get('p',1), items_per_page=20)
		users = self.DBSession.query(self.tUser)
		_pagination = self._pagination(pages)
		return {'entry':entry
			,'sucursales':pages
			,'companies':companies
			,'users':users.all()
			,'msj':msj
			,'pagination':_pagination
		}
	
	@action(renderer=BASE_TMPL  + "sucursales/list.pt")
	def filter(self):
		companies = self.DBSession.query(self.tCompany)
		page = webhelpers.paginate.Page(companies, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(page)
		return {'companies':page,'pagination':_pagination}
	
	@reify
	def companies_list(self):
		renderer = get_renderer(BASE_TMPL  + "sucursales/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		sucursal = self.tSucursal(
				 Nombre = self.request.POST['Nombre']
				,Direccion = self.request.POST['Direccion']
				,Correo = self.request.POST['Correo']
				,idcompany = self.request.POST['idcompany']
			)
		self.DBSession.add(sucursal)
		return HTTPFound(location='/sucursales/m=ric')
		
	@action()
	def update(self):
		company = self.DBSession.query(self.tSucursal).filter_by(id=self.request.POST['sucursal_id']).update({
													 'Nombre': self.request.POST['Nombre']
													,'Direccion': self.request.POST['Direccion']
													,'Correo': self.request.POST['Correo']
													,'idcompany': self.request.POST['idcompany']
													})
		return HTTPFound(location='/sucursales/m=rec')
	
	@action()
	def delete(self):
		sucursal_id = self.request.matchdict['id'] 
		sucursal = self.DBSession.query(self.tSucursal).filter_by(id=sucursal_id).delete()
		return HTTPFound(location='/sucursales/m=rdc')
				