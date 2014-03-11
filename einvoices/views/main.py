#from einvoices.library.security import security
import hashlib
import random
from pyramid.view import (
    forbidden_view_config,
    )
from sqlalchemy import engine_from_config
from pyramid.httpexceptions import HTTPFound
from einvoices.library.session import session
from einvoices.library.menu import SITE_MENU
from pyramid_handlers import action
from pyramid.renderers import get_renderer
from layouts import Layouts
from pyramid.response import Response
from pyramid.security import (
    remember,
    forget,
    )
from pyramid.decorator import reify
from pyramid.security import authenticated_userid
from einvoices.models.company import Company
from einvoices.models.user import (
	DBSession,
    	User,
    )

BASE_TMPL = 'einvoices:templates/'
import cPickle as pickle

class Object(object):
    pass

class Main(Layouts):
	def __init__(self, request):
		self.request = request
		self.session = session(request)
		path  = self.request.path
		if (self.session.verify_login() == False and path != '/main/login'):
			raise HTTPFound(location='/main/login')
		user_id = self.session.read_session_key('user_id')
		self.__user__ = DBSession.query(User).filter_by(id=user_id).first()
		if(self.__user__):
			company_id = self.session.read_session_key('company_id')
			if not company_id:
				self.session.save_in_session('company_id',self.__user__.company.id)
				self.__group_company__ = self.__user__.company.group;
				self.user_group = 'group:' + self.__user__.company.group;
				self.__current_company__ = DBSession.query(Company).filter_by(id=self.__user__.company.id).first()
			else:
				self.__current_company__ = DBSession.query(Company).filter_by(id=company_id).first()
				self.__group_company__ = self.__current_company__.group;
				self.user_group = 'group:' + self.__current_company__.group;					
		
	@action(renderer=BASE_TMPL  + "main/login.pt")
	@forbidden_view_config(renderer=BASE_TMPL  + "main/login.pt")
	def login(self):
		if 'username' in self.request.POST and 'password' in self.request.POST:
			user_name = self.request.POST.get('username', '')
			passwd = self.request.POST.get('password', '')
			try:
				md5 = hashlib.md5()
				md5.update(passwd)
				password = md5.hexdigest()
				user = DBSession.query(User).filter_by(email=user_name,password=password).first()
				if user:
					session_id = self.session.save_in_session('user_id',user.id)
					self.request.response.set_cookie('session_id', session_id,max_age=None,path='/')														
					return HTTPFound(location='/',headers=[ (k,v) for (k,v)\
						in self.request.response.headers.iteritems() if k == 'Set-Cookie'])
				else:
					return HTTPFound(location='/main/login')
			except Exception, e:
				return HTTPFound(location='/main/login')
		return {}
		
	@action()
	def logout(self):
		#headers = forget(self.request)
		self.request.response.delete_cookie('session_id', path='/')
		return HTTPFound(location='/main/login',headers=[ (k,v) for (k,v)\
						in self.request.response.headers.iteritems() if k == 'Set-Cookie'])
		
	@reify
	def site_menu(self):
		new_menu = SITE_MENU[:]
		url = self.request.url
		for section in new_menu:
			children = section['children']
			section['current'] = False
			section['show'] = self.groupfinder(section,self.user_group)
			for menu in children:
				menu['show'] = self.groupfinder(menu,self.user_group)
				if menu['view'] == self.config_view_name:
					menu['current'] = True
					section['current'] = True
				else:
					menu['current'] = False
		return new_menu

	def groupfinder(self,source,ugroup):
		if ugroup in source['groups']:
			return True
		else: 
			return False			

	def _pagination(self,page):
		paginator  = []
		index = int(self.request.GET.get('p','1'))

		for i in range(page.page_count):
			objectx = Object()
			objectx.index = i + 1
			path = self.request.POST.get('path',self.request.path)
			objectx.url = path  + '?p='  + str(objectx.index)
			if (index == objectx.index):
				objectx.current = True
			else:
				objectx.current = False
				
			paginator.append(objectx)
		return paginator
		
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

	def generateRandomString(self,length = 10):
		characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		randomString = '';
		for i in range(length):
			randomString = randomString + characters[random.randint(0,len(characters) - 1)]
		return randomString

	def make_engine(self):
		# vars for the connection url
   		username = self.__user__.company.user
   		password = self.__user__.company.password
   		host = 'localhost'
   		database = 'einvoices'
 
  		# specify the url (and other settings if we had them)
   		settings = {
         	'url': 'mysql://%s:%s@%s/%s' % (username, password, host, database)
        }
 
   		# actually create the engine with the sqlalchemy factory method
   		return engine_from_config(settings, prefix='')		