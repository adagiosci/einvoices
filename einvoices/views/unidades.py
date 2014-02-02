from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
from main import Main
BASE_TMPL = 'einvoices:templates/'

from sqlalchemy.exc import DBAPIError
from einvoices.models.company import (
    Company,
    )
from einvoices.models.unidad import (
    DBSession,
    Unidad,
    )

class ProjectorUnidades(Main):
	def __init__(self, request):
		self.request = request
                
	@action(renderer=BASE_TMPL  + "unidades/index.pt")
	def index(self):
		msj = self.message();
		unidades = DBSession.query(Unidad)
		companies = DBSession.query(Company)
		return {'unidades':unidades.all(),'msj':msj, 'companies':companies.all()}
	#aqui me quede	
	@action(renderer=BASE_TMPL  + "unidades/edit.pt")
	def edit(self):
		msj = self.message();
		unidades = DBSession.query(Unidad)
		companies = DBSession.query(Company)
		unidad_id = self.request.matchdict['id']
		entry = DBSession.query(Unidad).filter_by(id=unidad_id).first()
		return {'entry':entry,'unidades':unidades,'msj':msj, 'companies':companies.all()}
	
	@reify
	def unidades_list(self):
		renderer = get_renderer(BASE_TMPL  + "unidades/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		unidad = Unidad(clave = self.request.POST['clave'] 
				,description = self.request.POST['description']
				,idcompany = self.request.POST['idcompany']
			)
		DBSession.add(unidad)
		return HTTPFound(location='/unidades/m=ric')
		
	@action()
	def update(self):
		unidad = DBSession.query(Unidad).filter_by(id=self.request.POST['unidad_id']).update({
													 'clave': self.request.POST['clave']
													,'description': self.request.POST['description']
													,'idcompany': self.request.POST['idcompany']
													})
		return HTTPFound(location='/unidades/m=rec')
	
	@action()
	def delete(self):
		unidad_id = self.request.matchdict['id'] 
		unidad = DBSession.query(Unidad).filter_by(id=unidad_id).delete()
		#DBSession.delete(company)
		return HTTPFound(location='/unidades/m=rdc')
		
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
				

