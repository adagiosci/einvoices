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

from einvoices.models.supplier import (
    DBSession,
    Supplier,
    )

class ProjectorSuppliers(Main):
	def __init__(self, request):
		self.DBSession = DBSession()
		self.tSupplier = Supplier()
		self.config_view_name = 'suppliers'
		super(ProjectorSuppliers,self).__init__(request)

	@action(renderer=BASE_TMPL  + "suppliers/index.pt")
	def index(self):
		msj = self.message();
		suppliers = self.DBSession.query(self.tSupplier)
		pages = webhelpers.paginate.Page(suppliers, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		return {'suppliers':pages,'msj':msj,'pagination':_pagination}
	#aqui me quede
	
	@action(renderer=BASE_TMPL  + "suppliers/edit.pt")
	def edit(self):
		msj = self.message();
		suppliers = self.DBSession.query(self.tSupplier)
		pages = webhelpers.paginate.Page(suppliers, page=self.request.GET.get('p',1), items_per_page=20)
		supplier_id = self.request.matchdict['id']
		entry = self.DBSession.query(self.tSupplier).filter_by(id=supplier_id).first()
		_pagination = self._pagination(pages)
		return {'entry':entry,'suppliers':pages,'msj':msj,'pagination':_pagination}

	@action(renderer=BASE_TMPL  + "suppliers/list.pt")
	def filter(self):
		suppliers = self.DBSession.query(self.tSupplier)
		pages = webhelpers.paginate.Page(suppliers, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		return {'suppliers':pages,'pagination':_pagination}		
	
	@reify
	def supp_list(self):
		renderer = get_renderer(BASE_TMPL  + "suppliers/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		supplier = self.tSupplier(rfc = self.request.POST['rfc'] 
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
		self.DBSession.add(supplier)
		return HTTPFound(location='/suppliers/m=ric')
		
	@action()
	def update(self):
		supplier = self.DBSession.query(self.tSupplier).filter_by(id=self.request.POST['supplier_id']).update({
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
		supplier = self.DBSession.query(self.tSupplier).filter_by(id=supplier_id).delete()
		#DBSession.delete(company)
		return HTTPFound(location='/suppliers/m=rdc')