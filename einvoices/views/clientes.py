import hashlib
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

from einvoices.vmodels.vcompany import vCompany
from einvoices.vmodels.vsucursal import vSucursal
from einvoices.vmodels.vcliente import (
    vDBSession,
    vCliente,
    )

from einvoices.models.company import Company
from einvoices.models.sucursal import Sucursal
from einvoices.models.cliente import (
    DBSession,
    Cliente,
    )

class ProjectorClientes(Main):
	def __init__(self, request):
		self.DBSession = vDBSession
		self.tCompany = vCompany
		self.tSucursal = vSucursal
		self.tCliente = vCliente
		self.config_view_name = 'clients'
		super(ProjectorClientes,self).__init__(request)
		
	@action(renderer=BASE_TMPL  + "clients/index.pt")
	def index(self):
		msj = self.message();
		clientes = self.DBSession.query(self.tCliente)
		sucursales = self.DBSession.query(self.tSucursal)
		pages = webhelpers.paginate.Page(clientes, page=self.request.GET.get('p',1), items_per_page=20)
		companies = self.DBSession.query(self.tCompany)
		_pagination = self._pagination(pages)
		return {'clientes':pages,'msj':msj,'companies':companies.all(),'sucursales':sucursales.all(),'pagination':_pagination}
		
	#aqui me quede
	@action(renderer=BASE_TMPL  + "clients/edit.pt")
	def edit(self):
		msj = self.message();
		clientes = self.DBSession.query(self.tCliente)
		sucursales = self.DBSession.query(self.tSucursal)
		pages = webhelpers.paginate.Page(clientes, page=self.request.GET.get('p',1), items_per_page=20)
		cliente_id = self.request.matchdict['id']
		entry = self.DBSession.query(self.tCliente).filter_by(id=cliente_id).first()
		companies = self.DBSession.query(self.tCompany)
		_pagination = self._pagination(pages)
		return {'entry':entry,'clientes':pages,'msj':msj,'companies':companies.all(),'sucursales':sucursales.all(),'pagination':_pagination}
		
	@action(renderer=BASE_TMPL  + "clients/list.pt")
	def filter(self):
		clientes = self.DBSession.query(self.tCliente)
		pages = webhelpers.paginate.Page(clientes, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		return {'clientes':pages,'pagination':_pagination}		
	
	@reify
	def clientes_list(self):
		renderer = get_renderer(BASE_TMPL  + "clients/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		cliente = self.tCliente(RFC = self.request.POST['RFC'] 
				,RazonSocial = self.request.POST['RazonSocial'] 
				,Direccion = self.request.POST['Direccion']
				,idcompany = self.request.POST['idcompany']
				,id_Sucursal = self.request.POST['id_Sucursal']
			)
		self.DBSession.add(cliente)
		return HTTPFound(location='/clients/m=ric')
		
	@action()
	def update(self):
		#md5 = hashlib.md5()
		#md5.update(self.request.POST['password'])
		#password = md5.hexdigest()
		cliente = self.DBSession.query(self.tCliente).filter_by(id=self.request.POST['cliente_id']).update({
													 'RFC': self.request.POST['RFC']
													,'RazonSocial': self.request.POST['RazonSocial']
													,'Direccion': self.request.POST['Direccion']
													,'idcompany': self.request.POST['idcompany']
													,'id_Sucursal': self.request.POST['id_Sucursal']
													})
		return HTTPFound(location='/clients/m=rec')
	
	@action()
	def delete(self):
		cliente_id = self.request.matchdict['id'] 
		cliente = self.DBSession.query(self.tCliente).filter_by(id=cliente_id).delete()
		#DBSession.delete(company)
		return HTTPFound(location='/clients/m=rdc')
		