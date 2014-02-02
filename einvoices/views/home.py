from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
from main import Main
BASE_TMPL = 'einvoices:templates/'

from sqlalchemy.exc import DBAPIError

class ProjectorHome(Main):
	def __init__(self, request):
		self.request = request
        
	#@action(renderer=BASE_TMPL  + "main/login.pt")
	def index(self):
		msj = self.message()
		return {'msj':msj}
		
	def message(self):
		msj = {}
		msj['e'] = ''
		msj['s'] = ''
		return msj