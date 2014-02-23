import hashlib
import random
from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from saas import saas
from pyramid.view import view_config
import webhelpers.paginate
from pyramid.httpexceptions import HTTPFound
from main import Main
BASE_TMPL = 'einvoices:templates/'

from sqlalchemy.exc import DBAPIError

from einvoices.models.user import (
    DBSession,
    User,
    )

class ProjectorUsers(Main):
	
        def __init__(self, request):
		self.config_view_name = 'users'
		super(ProjectorUsers,self).__init__(request)	
                
	@action(renderer=BASE_TMPL  + "users/index.pt")
	def index(self):
		msj = self.message();
		users = DBSession.query(User)
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
		users = DBSession.query(User)
		pages = webhelpers.paginate.Page(users, page=self.request.GET.get('p',1), items_per_page=20)
		user_id = self.request.matchdict['id']
		entry = DBSession.query(User).filter_by(id=user_id).first()
		_pagination = self._pagination(pages)
		return {'entry':entry,'users':pages,'msj':msj,'pagination':_pagination}
		
	@action(renderer=BASE_TMPL  + "users/list.pt")
	def filter(self):
		users = DBSession.query(User)
		pages = webhelpers.paginate.Page(users, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		return {'users':pages,'pagination':_pagination}	
	
	@reify
	def users_list(self):
		renderer = get_renderer(BASE_TMPL  + "users/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		md5 = hashlib.md5()
		md5.update(self.request.POST['password'])
		password = md5.hexdigest()
		user = User(email = self.request.POST['email'] 
				,password = password
				,names = self.request.POST['names']
				,last_name = self.request.POST['last_name']
				,mother_name = self.request.POST['mother_name']
			)
		DBSession.add(user)
		return HTTPFound(location='/users/m=ric')
		
	@action()
	def update(self):
		#md5 = hashlib.md5()
		#md5.update(self.request.POST['password'])
		#password = md5.hexdigest()
		user = DBSession.query(User).filter_by(id=self.request.POST['user_id']).update({
													 'email': self.request.POST['email']
													,'names': self.request.POST['names']
													,'last_name': self.request.POST['last_name']
													,'mother_name': self.request.POST['mother_name']
													})
		return HTTPFound(location='/users/m=rec')
	
	@action()
	def delete(self):
		user_id = self.request.matchdict['id'] 
		user = DBSession.query(User).filter_by(id=user_id).delete()
		#DBSession.delete(company)
		return HTTPFound(location='/users/m=rdc')

	@action()
	def changepassword(self):
		user_name = self.__user__.email
		passwd = self.request.POST['password'] 
		md5 = hashlib.md5()
		md5.update(passwd)
		password = md5.hexdigest()	
		user = DBSession.query(User).filter_by(email=user_name,password=password).first()
		if (user):
			newpasswd = self.request.POST['newpassword']
			md5 = hashlib.md5()
			md5.update(newpasswd)
			password = md5.hexdigest()
			uuser = DBSession.query(User).filter_by(id=self.__user__.id).update({'password' : password})
		
		return HTTPFound(location='/users/password')

	@action(renderer='string')	
	def saas(self):
		saas2 = saas()
		# saas2.create_user_companies()
		return "Hello world"

	@action(renderer=BASE_TMPL  + "users/triggers.pt")
	def triggers(self):
		saas2 = saas()
		tables = saas2.create_trigger();
		return 	{'tables' : tables}		

				
