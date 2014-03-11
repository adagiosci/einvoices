import hashlib
import random
from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from saas import saas
from einvoices.library.menu import SITE_MENU
from pyramid.view import view_config, forbidden_view_config
import webhelpers.paginate
from pyramid.httpexceptions import HTTPFound
from main import Main
from einvoices.models.permission import Permission
BASE_TMPL = 'einvoices:templates/'
from einvoices.models.RootFactory import RootFactory

from sqlalchemy.exc import DBAPIError

from einvoices.models.company import Company
from einvoices.models.user import (
    DBSession,
    User,
    )

class ProjectorUsers(Main):
	def __init__(self, request):
		self.config_view_name = 'users'
		super(ProjectorUsers,self).__init__(request)
		self.DBSession = DBSession()
		self.tUser = User()
		self.tCompany = Company
				                
	@action(renderer=BASE_TMPL  + "users/index.pt")
	def index(self):
		msj = self.message();
		if(self.__current_company__.group == 'Admin'):
			companies = self.DBSession.query(self.tCompany)
			users = self.DBSession.query(User)
		else:
			companies = self.DBSession.query(self.tCompany).filter_by(id=self.__current_company__.id)
			users = self.DBSession.query(User).filter_by(company_id=self.__current_company__.id)
		pages = webhelpers.paginate.Page(users, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		
		return {'users':pages,'msj':msj,'pagination':_pagination,'companies':companies.all()}

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
		companies = self.DBSession.query(self.tCompany)
		return {'entry':entry,'users':pages,'msj':msj,'pagination':_pagination,'companies':companies.all()}
		
	@action(renderer=BASE_TMPL  + "users/list.pt")
	def filter(self):
		users = self.DBSession.query(self.tUser)
		pages = webhelpers.paginate.Page(users, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(pages)
		return {'users':pages,'pagination':_pagination}

	@action(renderer=BASE_TMPL + "users/permissions.pt")
	def permissions(self):
		msj = self.message();
		user_id = self.request.matchdict['id']
		return{'msj':msj,'catalogs':SITE_MENU,'user_id':user_id}	
	
	@reify
	def users_list(self):
		renderer = get_renderer(BASE_TMPL  + "users/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		md5 = hashlib.md5()
		md5.update(self.request.POST['password'])
		password = md5.hexdigest()
		if(self.__group_company__ == 'Admin'):
			company_id = self.request.POST['company']
			ocompany = self.DBSession.query(self.tCompany).filter_by(id=company_id).first();
			tenant_id = ocompany.tenant_id
		else:
			company_id = self.__user__.company.id

		user = self.tUser(
				email = self.request.POST['email'] 
				,password = password
				,names = self.request.POST['names']
				,last_name = self.request.POST['last_name']
				,mother_name = self.request.POST['mother_name']
				,company_id = company_id
			)
		self.DBSession.add(user)
		self.DBSession.flush()
		if(self.__group_company__ == 'Admin'):
			self.DBSession.query(self.tUser).filter_by(id=user.id).update({'tenant_id':tenant_id})
		return HTTPFound(location='/users/m=ric')
		
	@action()
	def update(self):
		if(self.__group_company__== 'Admin'):
			company_id = self.request.POST['company']
			ocompany = self.DBSession.query(self.tCompany).filter_by(id=company_id).first();
			tenant_id = ocompany.tenant_id
		else:
			company_id = self.__user__.company.id
			ocompany = self.DBSession.query(self.tCompany).filter_by(id=company_id).first();
			tenant_id = ocompany.tenant_id			

		user = self.DBSession.query(self.tUser).filter_by(id=self.request.POST['user_id']).update({
													 'email': self.request.POST['email']
													,'names': self.request.POST['names']
													,'last_name': self.request.POST['last_name']
													,'mother_name': self.request.POST['mother_name']
													,'company_id':company_id
													,'tenant_id' :tenant_id
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
		for section in new_menu: #catalogs
			section['show'] = self.groupfinder(section,self.user_group)
			children = section['children']
			for menu in children: #menu
				menu['show'] = self.groupfinder(menu,self.user_group)
		return new_menu

	def array_permissions(self):
		permissions = []
		for section  in SITE_MENU:
			#permissions.append(section['href'])
			for menu in section['children']:
				permissions.append(menu['href'])
				for crud in menu['children']:
					permissions.append(crud['href'])
		return permissions	

	@action()
	def actpermissions(self):
		permissions = self.array_permissions()
		for permission in permissions:
			if permission in self.request.params.getall('permissions'):
				result = DBSession.query(Permission).filter_by(user_id=self.request.POST['user_id']).filter_by(permission=permission).first()
				if(result):
					DBSession.query(Permission).filter_by(user_id=self.request.POST['user_id']).filter_by(permission=permission).update({'permission':permission})
				else:
					Register = Permission(
							user_id=self.request.POST['user_id']
							,permission=permission
							,value='1'
							)
					DBSession.add(Register)
			else:
				result = DBSession.query(Permission).filter_by(user_id=self.request.POST['user_id']).filter_by(permission=permission).first()
				if(result):
					DBSession.query(Permission).filter_by(user_id=self.request.POST['user_id']).filter_by(permission=permission).update({'permission':permission})
				else:
					Register = Permission(
							user_id=self.request.POST['user_id']
							,permission=permission
							,value='0'
							)
					DBSession.add(Register)				
		return HTTPFound(location='/users/permissions/' + self.request.POST['user_id'])