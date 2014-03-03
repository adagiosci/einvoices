import hashlib
import random
from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from saas import saas
from einvoices.library.menu import SITE_MENU
from pyramid.view import view_config
import webhelpers.paginate
from pyramid.httpexceptions import HTTPFound
from main import Main
BASE_TMPL = 'einvoices:templates/'

from sqlalchemy.exc import DBAPIError

from einvoices.vmodels.vuser import (
    vDBSession,
    vUser,
    )
from einvoices.models.user import (
    DBSession,
    User,
    )

#USERS = {'editor':'editor',
#          'viewer':'viewer'}
#GROUPS = {'editor':['group:editors']}

class ProjectorUsers(Main):
	
	def __init__(self, request):
		self.DBSession = vDBSession
		self.tUser = vUser
		self.config_view_name = 'users'
		super(ProjectorUsers,self).__init__(request)	
                
	@action(renderer=BASE_TMPL  + "users/index.pt")
	def index(self):
		#print self.groupfinder('Admin')
		msj = self.message();
		users = self.DBSession.query(self.tUser)
		pages = webhelpers.paginate.Page(users, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		return {'users':pages,'msj':msj,'pagination':_pagination}

	@action(renderer=BASE_TMPL  + "users/password.pt")
	def password(self):
		self.config_view_name = 'password'
		msj = self.message();
		return{'msj' : msj}

	#aqui me quede	
	@action(renderer=BASE_TMPL  + "users/edit.pt")
	def edit(self):
		msj = self.message();
		users = self.DBSession.query(self.tUser)
		pages = webhelpers.paginate.Page(users, page=self.request.GET.get('p',1), items_per_page=20)
		user_id = self.request.matchdict['id']
		entry = self.DBSession.query(self.tUser).filter_by(id=user_id).first()
		_pagination = self._pagination(pages)
		return {'entry':entry,'users':pages,'msj':msj,'pagination':_pagination}
		
	@action(renderer=BASE_TMPL  + "users/list.pt")
	def filter(self):
		users = self.DBSession.query(self.tUser)
		pages = webhelpers.paginate.Page(users, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		return {'users':pages,'pagination':_pagination}

	@action(renderer=BASE_TMPL + "users/permissions.pt")
	def permissions(self):
		msj = self.message();
		return{'msj':msj,'catalogs':SITE_MENU}	
	
	@reify
	def users_list(self):
		renderer = get_renderer(BASE_TMPL  + "users/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		md5 = hashlib.md5()
		md5.update(self.request.POST['password'])
		password = md5.hexdigest()
		user = self.tUser(email = self.request.POST['email'] 
				,password = password
				,names = self.request.POST['names']
				,last_name = self.request.POST['last_name']
				,mother_name = self.request.POST['mother_name']
			)
		self.DBSession.add(user)
		return HTTPFound(location='/users/m=ric')
		
	@action()
	def update(self):
		user = self.DBSession.query(self.tUser).filter_by(id=self.request.POST['user_id']).update({
													 'email': self.request.POST['email']
													,'names': self.request.POST['names']
													,'last_name': self.request.POST['last_name']
													,'mother_name': self.request.POST['mother_name']
													})
		#vDBSession.commit()
		return HTTPFound(location='/users/m=rec')
	
	@action()
	def delete(self):
		user_id = self.request.matchdict['id'] 
		user = self.DBSession.query(self.tUser).filter_by(id=user_id).delete()
		#DBSession.delete(company)
		return HTTPFound(location='/users/m=rdc')

	@action()
	def changepassword(self):
		user_name = self.__user__.email
		passwd = self.request.POST['password'] 
		md5 = hashlib.md5()
		md5.update(passwd)
		password = md5.hexdigest()	
		user = self.DBSession.query(self.tUser).filter_by(email=user_name,password=password).first()
		if (user):
			newpasswd = self.request.POST['newpassword']
			md5 = hashlib.md5()
			md5.update(newpasswd)
			password = md5.hexdigest()
			uuser = vDBSession.query(vUser).filter_by(id=self.__user__.id).update({'password' : password})
		
		return HTTPFound(location='/users/password')

	@action(renderer='string')	
	def saas(self):
		saas2 = saas()
		saas2.create_views()
		return "Hello world"

	@action(renderer=BASE_TMPL  + "users/triggers.pt")
	def triggers(self):
		saas2 = saas()
		tables = saas2.create_trigger();
		return 	{'tables' : tables}

	@action(renderer='string')	
	def create_user(self):
		saas2 = saas()
		saas2.create_user_companies()
		return "Hello world"

	@reify
	def permission_menu(self):
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

	#def groupfinder(self,userid):
	#	if (userid in USERS):
	#		return GROUPS.get(userid, [])	