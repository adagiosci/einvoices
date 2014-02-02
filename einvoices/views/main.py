#from einvoices.library.security import security
import hashlib
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
        {'view':'companies','href': '/companies', 'title': 'Empresas'},
        {'view':'units','href': '/unidades', 'title': 'Unidades'},
        {'view':'users','href': '/users', 'title': 'Usuarios'},
        {'view':'suppliers','href': '/suppliers', 'title': 'Provedores'},
        {'view':'clients','href': '/clients', 'title': 'Clientes'},
]    
    
BASE_TMPL = 'einvoices:templates/'
import cPickle as pickle

class Object(object):
    pass

class Main(Layouts):
	def __init__(self, request):
		self.request = request
		self.session = session(request)
		user_id = authenticated_userid(self.request)
		path = self.request.path
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
				print password
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
		for menu in new_menu:
			if menu['view'] == self.config_view_name:
				menu['current'] = True
			else:
				menu['current'] = False
		return new_menu
		
	def _pagination(self,page):
		paginator  = []
		index = int(self.request.GET.get('p','1'))

		for i in range(page.page_count):
			objectx = Object()
			objectx.index = i + 1
			objectx.url = self.request.path  + '?p='  + str(objectx.index)
			if (index == objectx.index):
				objectx.current = True
			else:
				objectx.current = False
				
			paginator.append(objectx)
			
		#if(isset($this->infopaginator->previous)){
			#$paginator.= "<a href='/{$this->view->controller}/$action?p={$this->infopaginator->first}{$param}'>&lt;&lt</a>";
			#$paginator.= "<a href='/{$this->view->controller}/$action?p={$this->infopaginator->previous}{$param}'>Prev</a>";
		#}
		#foreach($this->infopaginator->pagesInRange as $r){
			#$on = ($r == $this->infopaginator->current)?"class='on'":"";
			#$paginator.="<a $on href='/{$this->view->controller}/$action?p=$r{$param}'>".$r."</a>";
		#}
		#if(isset($this->infopaginator->next)){
			#$paginator.="<a href='/{$this->view->controller}/$action?p={$this->infopaginator->next}{$param}'>Next</a>";
			#$paginator.="<a href='/{$this->view->controller}/$action?p={$this->infopaginator->last}{$param}'>&gt;&gt;</a>";
		#}
		#$this->view->totalItemCount = $this->infopaginator->totalItemCount;
		#$this->view->lastItemNumber = $this->infopaginator->lastItemNumber;
		#$this->view->pagination = $paginator;
		return paginator