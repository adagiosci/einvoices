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
from einvoices.models.user import (
    User,
    )

from einvoices.models.sucursal import (
    Sucursal,
    )    
    
from einvoices.models.company import (
    DBSession,
    Company,
    )

class ProjectorSucursales(Main):
	
        def __init__(self, request):
		self.config_view_name = 'sucursales'
		super(ProjectorSucursales,self).__init__(request)
		
	@action(renderer=BASE_TMPL  + "sucursales/index.pt")
	def index(self):
		#self.insertdb()
		msj = self.message();
		companies = DBSession.query(Company)
		sucursales = DBSession.query(Sucursal)
		pages = webhelpers.paginate.Page(sucursales, page=self.request.GET.get('p',1), items_per_page=20)
		users = DBSession.query(User)
		_pagination = self._pagination(pages)
		return {'sucursales':pages,'companies':companies,'msj':msj,'pagination':_pagination}
		
	@action(renderer=BASE_TMPL  + "sucursales/edit.pt")
	def edit(self):
		msj = self.message();
		companies = DBSession.query(Company)
		sucursal_id = self.request.matchdict['id']
		entry = DBSession.query(Sucursal).filter_by(id=sucursal_id).first()
		sucursales = DBSession.query(Sucursal)
		pages = webhelpers.paginate.Page(sucursales, page=self.request.GET.get('p',1), items_per_page=20)
		users = DBSession.query(User)
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
		companies = DBSession.query(Company)
		page = webhelpers.paginate.Page(companies, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(page)
		return {'companies':page,'pagination':_pagination}
	
	@reify
	def companies_list(self):
		renderer = get_renderer(BASE_TMPL  + "sucursales/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		sucursal = Sucursal(
				 Nombre = self.request.POST['Nombre']
				,Direccion = self.request.POST['Direccion']
				,Correo = self.request.POST['Correo']
				,idcompany = self.request.POST['idcompany']
			)
		DBSession.add(sucursal)
		return HTTPFound(location='/sucursales/m=ric')
		
	@action()
	def update(self):
		company = DBSession.query(Sucursal).filter_by(id=self.request.POST['sucursal_id']).update({
													 'Nombre': self.request.POST['Nombre']
													,'Direccion': self.request.POST['Direccion']
													,'Correo': self.request.POST['Correo']
													,'idcompany': self.request.POST['idcompany']
													})
		return HTTPFound(location='/sucursales/m=rec')
	
	@action()
	def delete(self):
		sucursal_id = self.request.matchdict['id'] 
		sucursal = DBSession.query(Sucursal).filter_by(id=sucursal_id).delete()
		return HTTPFound(location='/sucursales/m=rdc')
		
	def errormsj(self,code):
		message = {}
		message['ac'] = "Hubo un error al activar el registro"
		message['in'] = "Hubo un error al inactivar el registro"
		message['edc'] = "Hubo un error al eliminar el registro"
		return message[code]
		
	def succesms(self,code):
		message  = {}
		message['rec'] = "El registro se edito exitosamente"
		message['ric'] = "El registro se inserto exitosamente"
		message['rdc'] = "El registro se elimino exitosamente"
		return message[code]
		
	def message(self):
		msj = {}
		msj['e'] = ''
		msj['s'] = ''
		try:
			m = self.request.matchdict['m']
			msj['s'] = self.succesms(m)
		except Exception, e:
			print repr(e)
			
		try:
			ex = self.request.matchdict['e']
			msj['e'] = self.succesms(ex)
		except Exception, e:
			print repr(e)
			
		return msj
				