from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
import webhelpers.paginate
from layouts import Layouts
BASE_TMPL = 'einvoices:templates/'

from sqlalchemy.exc import DBAPIError

from einvoices.models.company import (
    DBSession,
    Company,
    )

class ProjectorCompanies(Layouts):
	def __init__(self, request):
		self.request = request
                
        def insertdb(self):
		for i in range(100000):
			company = Company(name = 'manglesoft' 
				,rfc = 'x'
				,address = 'x'
				,cp = 'x'
				,corporateName = 'x'
				,curp = 'x'
			)			
			DBSession.add(company)
                
	@action(renderer=BASE_TMPL  + "companies/index.pt")
	def index(self):
		#self.insertdb()
		msj = self.message();
		companies = DBSession.query(Company)
		page2 = webhelpers.paginate.Page(companies, page=2, items_per_page=30)
		return {'companies':page2,'msj':msj}
		
	@action(renderer=BASE_TMPL  + "companies/edit.pt")
	def edit(self):
		msj = self.message();
		companies = DBSession.query(Company)
		company_id = self.request.matchdict['id']
		entry = DBSession.query(Company).filter_by(id=company_id).first()
		page2 = webhelpers.paginate.Page(companies, page=2, items_per_page=30)
		return {'entry':entry,'companies':page2,'msj':msj}
	
	@reify
	def companies_list(self):
		renderer = get_renderer(BASE_TMPL  + "companies/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		company = Company(name = self.request.POST['name'] 
				,rfc = self.request.POST['rfc']
				,address = self.request.POST['address']
				,cp = self.request.POST['cp']
				,corporateName = self.request.POST['corporateName']
				,curp = self.request.POST['curp']
			)
		DBSession.add(company)
		return HTTPFound(location='/companies/m=ric')
		
	@action()
	def update(self):
		company = DBSession.query(Company).filter_by(id=self.request.POST['company_id']).update({
													 'name': self.request.POST['name']
													,'rfc': self.request.POST['rfc']
													,'address': self.request.POST['address']
													,'cp': self.request.POST['cp']
													,'corporateName': self.request.POST['corporateName']
													,'curp': self.request.POST['curp']
													})
		return HTTPFound(location='/companies/m=rec')
	
	@action()
	def delete(self):
		company_id = self.request.matchdict['id'] 
		company = DBSession.query(Company).filter_by(id=company_id).delete()
		return HTTPFound(location='/companies/m=rdc')
		
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
				