from pyramid.security import Allow, Everyone, Deny
from pyramid.security import authenticated_userid
from .meta import (
	Base,
	DBSession,
)

def groupfinder(userid, request): #Aqui optenemos el grupo de empresa en donde pertece el usuario logueado
	query = "SELECT companies.group FROM users JOIN companies ON users.company_id = companies.id WHERE users.id = " + str(userid)
	result = DBSession.execute(query).first()
	return [str(result.group)]

class RootFactory(object):
	@property
	def  __acl__(self):
		user_id = authenticated_userid(self.request)
		acl = []
		query = "SELECT * FROM permissions WHERE user_id = '" + str(user_id) + "'"
		result = DBSession.execute(query)
		for row in result:
			if row.value == 1:
				acl.append((Allow,'Admin',row.permission))
			else:
				acl.append((Deny,'Admin',row.permission))
		return acl
	
	def __init__(self, request):
		self.request = request
		pass