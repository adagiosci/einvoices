#from einvoices.library.security import security
from pyramid.httpexceptions import HTTPFound
from einvoices.library.session import session
from pyramid_handlers import action
from pyramid.renderers import get_renderer
from layouts import Layouts
from pyramid.security import (
    remember,
    forget,
    )
BASE_TMPL = 'einvoices:templates/'
import cPickle as pickle
class Main(Layouts):
	def __init__(self, request):
		self.request = request
		self.session = session(request)
		path = self.request.path
		#print request.route_url(suppliers_index)
		#result = self.session.verify_login()
		
	@action(renderer=BASE_TMPL  + "main/login.pt")
	def login(self):
		#if 'submit' in self.request.POST:
			#print 'Hello world'
		login = self.request.POST.get('login', '')
		passwd = self.request.POST.get('passwd', '')
		headers = remember(self.request, login)
		#return HTTPFound(location='/companies', headers=headers)
		return {}
		
	@action()
	def logout(self):
		headers = forget(self.request)
		return HTTPFound(location='/main/login', headers=headers)