from pyramid.renderers import get_renderer
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
from layouts import Layouts

from sqlalchemy.exc import DBAPIError

from .models import (
    DBSession,
    Aerolinea,
    )

class ProjectorViews(Layouts):
	def __init__(self, request):
		self.request = request
        
	@view_config(renderer="templates/clients/index.pt", name='clients')
	def clients_view(self):
		aerolineas = DBSession.query(Aerolinea).order_by(Aerolinea.idaerolinea)
		return {'aerolineas':aerolineas}
	@reify
	def clients_list(self):
		renderer = get_renderer("templates/clients/list.pt")
		return renderer.implementation().macros
		



