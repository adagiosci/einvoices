from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
import webhelpers.paginate
from pyramid.httpexceptions import HTTPFound
from main import Main
BASE_TMPL = 'einvoices:templates/'
from sqlalchemy.exc import DBAPIError


from einvoices.models.meta import DBSession
from einvoices.models.company import Company
from einvoices.models.unidad import Unidad

class ProjectorUnidades(Main):
	
   	def __init__(self, request):
   		super(ProjectorUnidades,self).__init__(request)
   		#if(self.__user__.company.group == 'Admin'):
   		#	self.DBSession = DBSession
   		#	self.Unidad = Unidad
   		#	self.Company = Company   			
   		#else:
   		#	self.DBSession = vDBSession
   		#	self.Unidad = vUnidad
   		#	self.Company = vCompany

   		self.DBSession = DBSession
   		self.Unidad = Unidad
   		self.Company = Company   		
		self.config_view_name = 'units'
                
	@action(renderer=BASE_TMPL  + "unidades/index.pt")
	def index(self):
		msj = self.message();
		unidades = self.DBSession.query(self.Unidad).filter_by(company_id = self.__current_company__.id)
		companies = self.DBSession.query(self.Company).filter_by(id=self.__current_company__.id)
		pages = webhelpers.paginate.Page(unidades, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		return {'unidades':pages,'msj':msj, 'companies':companies.all(),'pagination':_pagination}
	#aqui me quede
	
	@action(renderer=BASE_TMPL  + "unidades/edit.pt")
	def edit(self):
		msj = self.message();
		unidades = self.DBSession.query(self.Unidad).filter_by(company_id = self.__current_company__.id)
		pages = webhelpers.paginate.Page(unidades, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		companies = self.DBSession.query(self.Company).filter_by(id=self.__current_company__.id)
		unidad_id = self.request.matchdict['id']
		entry = self.DBSession.query(self.Unidad).filter_by(id=unidad_id,company_id = self.__current_company__.id).first()
		return {'entry':entry,'unidades':pages,'msj':msj, 'companies':companies.all(),'pagination':_pagination}
		
	@action(renderer=BASE_TMPL  + "unidades/list.pt")
	def filter(self):
		unidades = self.DBSession.query(self.Unidad)
		pages = webhelpers.paginate.Page(unidades, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		return {'unidades':pages,'pagination':_pagination}		
	
	@reify
	def unidades_list(self):
		renderer = get_renderer(BASE_TMPL  + "unidades/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		unidad = self.Unidad(clave = self.request.POST['clave'] 
				,description = self.request.POST['description']
				,company_id = self.__current_company__.id
			)
		self.DBSession.add(unidad)
		return HTTPFound(location='/unidades/m=ric')
		
	@action()
	def update(self):
		unidad = self.DBSession.query(self.Unidad).filter_by(id=self.request.POST['unidad_id']).update({
													 'clave': self.request.POST['clave']
													,'description': self.request.POST['description']
													,'company_id':  self.__current_company__.id
													})
		return HTTPFound(location='/unidades/m=rec')
	
	@action()
	def delete(self):
		unidad_id = self.request.matchdict['id'] 
		unidad = self.DBSession.query(self.Unidad).filter_by(id=unidad_id).delete()
		#DBSession.delete(company)
		return HTTPFound(location='/unidades/m=rdc')