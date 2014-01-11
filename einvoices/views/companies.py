from pyramid.renderers import get_renderer
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
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
        
	@view_config(renderer=BASE_TMPL  + "companies/index.pt", name='companies')
	def companies_view(self):
		companies = DBSession.query(Company)
		return {'companies':companies.all()}
	@reify
	def companies_list(self):
		renderer = get_renderer(BASE_TMPL  + "companies/list.pt")
		return renderer.implementation().macros