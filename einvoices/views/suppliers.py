from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
from layouts import Layouts
BASE_TMPL = 'einvoices:templates/'

from sqlalchemy.exc import DBAPIError

from einvoices.models.supplier import (
    DBSession,
    Supplier,
    )

class ProjectorSuppliers(Layouts):
	def __init__(self, request):
		self.request = request
                
	@action(renderer=BASE_TMPL  + "suppliers/index.pt")
	def index(self):
		msj = self.message();
		suppliers = DBSession.query(Supplier)
		return {'suppliers':suppliers.all(),'msj':msj}
	#aqui me quede	
	@action(renderer=BASE_TMPL  + "suppliers/edit.pt")
	def edit(self):
		msj = self.message();
		suppliers = DBSession.query(Supplier)
		supplier_id = self.request.matchdict['id']
		entry = DBSession.query(Supplier).filter_by(id=supplier_id).first()
		return {'entry':entry,'suppliers':suppliers,'msj':msj}
	
	@reify
	def supp_list(self):
		renderer = get_renderer(BASE_TMPL  + "suppliers/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		supplier = Supplier(rfc = self.request.POST['rfc'] 
				,contacto = self.request.POST['contacto']
				,noExterior = self.request.POST['noExterior']
				,colonia = self.request.POST['colonia']
				,localidad = self.request.POST['localidad']
				,pais = self.request.POST['pais']
				,cp = self.request.POST['cp']
				,razonsocial = self.request.POST['razonsocial']
				,calle = self.request.POST['calle']
				,noInterior = self.request.POST['noInterior']
				,referencia = self.request.POST['referencia']
				,municipio = self.request.POST['municipio']
				,estado = self.request.POST['estado']
				,email = self.request.POST['email']
			)
		DBSession.add(supplier)
		return HTTPFound(location='/suppliers/m=ric')
		
	@action()
	def update(self):
		supplier = DBSession.query(Supplier).filter_by(id=self.request.POST['supplier_id']).update({
													 'rfc': self.request.POST['rfc']
													,'contacto': self.request.POST['contacto']
													,'noExterior': self.request.POST['noExterior']
													,'colonia': self.request.POST['colonia']
													,'localidad': self.request.POST['localidad']
													,'pais': self.request.POST['pais']
													,'cp' : self.request.POST['pais']
													,'razonsocial' : self.request.POST['razonsocial']
													,'calle' : self.request.POST['calle']
													,'noInterior' : self.request.POST['noInterior']
													,'referencia' : self.request.POST['referencia']
													,'municipio' : self.request.POST['municipio']
													,'estado' : self.request.POST['estado']
													,'email' : self.request.POST['email']
													})
		return HTTPFound(location='/suppliers/m=rec')
	
	@action()
	def delete(self):
		supplier_id = self.request.matchdict['id'] 
		supplier = DBSession.query(Supplier).filter_by(id=supplier_id).delete()
		#DBSession.delete(company)
		return HTTPFound(location='/suppliers/m=rdc')
		
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
				
