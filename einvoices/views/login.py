from pyramid.renderers import get_renderer
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
from layouts import Layouts
BASE_TMPL = 'einvoices:templates/'

from sqlalchemy.exc import DBAPIError

from einvoices.models.user import (
    DBSession,
    Users,
    )

class LoginViews(Layouts):
	def __init__(self, request):
		self.request = request
	
	@view_config(renderer=BASE_TMPL + "login/login.pt", name='login')
	def login_view (self):
		users = DBSession.query(Users)
		return {"users": users.all()}
