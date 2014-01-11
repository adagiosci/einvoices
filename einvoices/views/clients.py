from pyramid.renderers import get_renderer
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
from layouts import Layouts
BASE_TMPL = 'einvoices:templates/'

from sqlalchemy.exc import DBAPIError

from einvoices.models.models import (
    DBSession,
    Aerolinea
    )

class ProjectorClients(Layouts):
	def __init__(self, request):
		self.request = request
        
	@view_config(renderer=BASE_TMPL  + "clients/index.pt", name='clients')
	def clients_view(self):
		aerolineas = DBSession.query(Aerolinea).order_by(Aerolinea.idaerolinea)
		return {'aerolineas':aerolineas.all()}
	@reify
	def clients_list(self):
		renderer = get_renderer(BASE_TMPL  + "clients/list.pt")
		return renderer.implementation().macros
		


