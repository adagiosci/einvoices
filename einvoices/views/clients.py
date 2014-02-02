from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
from main import Main

BASE_TMPL = 'einvoices:templates/'

from sqlalchemy.exc import DBAPIError

from einvoices.models.models import (
    DBSession,
    Aerolinea
    )

class ProjectorClients(Main):
	def __init__(self, request):
		self.request = request
        
	@view_config(renderer=BASE_TMPL  + "clients/index.pt")
	def clients_view(self):
		aerolineas = DBSession.query(Aerolinea).order_by(Aerolinea.idaerolinea)
		return {'aerolineas':aerolineas.all()}
	@reify
	def clients_list(self):
		renderer = get_renderer(BASE_TMPL  + "clients/list.pt")
		return renderer.implementation().macros
		



