#from einvoices.library.security import security
from pyramid.httpexceptions import HTTPFound
from einvoices.library.session import session
from pyramid_handlers import action
from pyramid.renderers import get_renderer
from layouts import Layouts
BASE_TMPL = 'einvoices:templates/'
import cPickle as pickle
class Main(Layouts):
	def __init__(self, request):
		self.request = request
		self.session = session(request)
		#print request.route_url(suppliers_index)
		#result = self.session.verify_login()
		
	@action(renderer=BASE_TMPL  + "main/login.pt")
	def login(self):
		return {}