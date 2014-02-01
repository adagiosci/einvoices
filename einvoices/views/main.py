#from einvoices.library.security import security
from pyramid.httpexceptions import HTTPFound
from einvoices.library.session import session
import cPickle as pickle
class main(object):
	def __init__(self, request):
		self.request = request
		self.session = session(request)
		#result = self.session.verify_login()
	def login(self):
		print 'Hola mundo'