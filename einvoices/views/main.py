#from einvoices.library.security import security
import hashlib
import random
from pyramid.httpexceptions import HTTPFound
from einvoices.library.session import session
from pyramid_handlers import action
from pyramid.renderers import get_renderer
from layouts import Layouts
from pyramid.security import (
    remember,
    forget,
    )
from pyramid.decorator import reify
from pyramid.security import authenticated_userid
from einvoices.models.user import (
    DBSession,
    User,
    )
SITE_MENU = [
        {
		'title': 'Catalogos',
		'children':[
			{'view':'units','href': '/unidades', 'title': 'Unidades'},
			{'view':'suppliers','href': '/suppliers', 'title': 'Provedores'},
			{'view':'clients','href': '/clients', 'title': 'Clientes'},
			{'view':'sucursales','href': '/sucursales', 'title': 'sucursales'},
		]
	},
	{
		'title':'Configuraciones',
		'children':[
			{'view':'users','href': '/users', 'title': 'Usuarios'},
			{'view':'companies','href': '/companies', 'title': 'Empresas'},
			{'view':'password','href':'/users/password','title':'Contrasena'},
		]
	},
]    
BASE_TMPL = 'einvoices:templates/'
import cPickle as pickle

class Object(object):
    pass

class Main(Layouts):
	def __init__(self, request):
		self.request = request
		self.session = session(request)
		path  = self.request.path
		user_id = authenticated_userid(self.request)
		if (user_id == None and path != '/main/login'):
			raise HTTPFound(location='/main/login')
		self.__user__ = DBSession.query(User).filter_by(id=user_id).first()
		
	@action(renderer=BASE_TMPL  + "main/login.pt")
	def login(self):
		if 'username' in self.request.POST and 'password' in self.request.POST:
			user_name = self.request.POST.get('username', '')
			passwd = self.request.POST.get('password', '')
			try:
				md5 = hashlib.md5()
				md5.update(passwd)
				password = md5.hexdigest()
				user = DBSession.query(User).filter_by(email=user_name,password=password).first()
				headers = remember(self.request, user.id, max_age='86400')
				return HTTPFound(location='/companies', headers=headers)
			except Exception, e:
				return HTTPFound(location='/main/login')
		return {}
		
	@action()
	def logout(self):
		headers = forget(self.request)
		return HTTPFound(location='/main/login', headers=headers)
		
	@reify
	def site_menu(self):
		new_menu = SITE_MENU[:]
		url = self.request.url
		for section in new_menu:
			children = section['children']
			section['current'] = False
			for menu in children:
				if menu['view'] == self.config_view_name:
					menu['current'] = True
					section['current'] = True
				else:
					menu['current'] = False
		return new_menu
		
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