from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
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
        
	@action(renderer=BASE_TMPL  + "companies/index.pt")
	def index(self):
		companies = DBSession.query(Company)
		company = DBSession.query(Company).first()
		print company.name
		return {'companies':companies.all()}
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
		#DBSession.commit()
		return HTTPFound(location='/companies')
		
	@action()
	def delete(self):
		company_id = self.request.GET['id']; 
		company = DBSession.query(Company).filter_by(id=company_id)
		DBSession.delete(company)
		return HTTPFound(location='/companies')	