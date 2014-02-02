import hashlib
from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
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
		self.request = request
                
	@action(renderer=BASE_TMPL  + "users/index.pt")
	def index(self):
		msj = self.message();
		users = DBSession.query(User)
		return {'users':users.all(),'msj':msj}
	#aqui me quede	
	@action(renderer=BASE_TMPL  + "users/edit.pt")
	def edit(self):
		msj = self.message();
		users = DBSession.query(User)
		user_id = self.request.matchdict['id']
		entry = DBSession.query(User).filter_by(id=user_id).first()
		return {'entry':entry,'users':users,'msj':msj}
	
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
				
