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
from einvoices.models.company import Company
from einvoices.models.user import (
    DBSession,
    User,
    )
class saas(object):
	def create_trigger(self):
		query = "SHOW FULL TABLES WHERE Table_type = 'BASE TABLE' AND Tables_in_einvoices != 'sessions'";
		tables = DBSession.execute(query)
		return tables;
			
	def create_views(self):
		query = "SHOW FULL TABLES WHERE Table_type = 'BASE TABLE'";
		tables = DBSession.execute(query)
		for tablex in tables:
			query = "DESCRIBE " + tablex.Tables_in_einvoices
			fields = DBSession.execute(query)
			queryView  = ""
			coma = ""
			for field in fields:
				if(field.Field != "tenant_id"):
					queryView = queryView +  coma + tablex.Tables_in_einvoices + '.' + field.Field + " as '" + field.Field + "'";
				coma = ", ";			
			queryView  = "CREATE OR REPLACE SQL SECURITY INVOKER VIEW v" + tablex.Tables_in_einvoices + " AS SELECT " + queryView + " FROM  " + tablex.Tables_in_einvoices + " WHERE (" + tablex.Tables_in_einvoices + ".tenant_id = substring_index(user(),'@',1));";
			print queryView
			try:
				DBSession.execute(queryView)
			except Exception, e:
				pass
	
	def drop_views(self):
		query = "SHOW FULL TABLES WHERE Table_type = 'VIEW'"
		tables = DBSession.execute(query)
		for tablex in tables:
			query = "DROP VIEW " + tablex.Tables_in_einvoices
			DBSession.execute(query)

	def create_user(self,user,password):
		query = "CREATE USER "+ user + "@localhost IDENTIFIED BY '" + password + "'"
		DBSession.execute(query)

		query = "GRANT SELECT, INSERT, UPDATE, DELETE, TRIGGER, SHOW VIEW, EXECUTE ON einvoices.* TO  " + user + "@'localhost'"
		DBSession.execute(query)

		query = "FLUSH PRIVILEGES";
		DBSession.execute(query)

	def create_user_companies(self):
		query = "SELECT * FROM companies"
		companies = DBSession.execute(query)			
		for row in companies:
			user = self.generateRandomString(5)
			password = self.generateRandomString(10)
			DBSession.query(Company).filter_by(id = row.id).update({'user':user, 'password':password,'tenant_id':user})

	def generateRandomString(self,length = 10):
		characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		randomString = '';
		for i in range(length):
			randomString = randomString + characters[random.randint(0,len(characters) - 1)]
		return randomString			