import hashlib
import random
import time
from pyramid.response import Response
import cPickle as pickle
import phpserialize
from collections import OrderedDict
from bookinghotel.models.user import User
from bookinghotel.models.session import DBSession, Session

SESSION_NAME = 'zavia_erp_user'

class session(object):
	def __init__(self, request):
		self.request = request

	def do_login_custom(self
				,user_class = 'user'
				,user_field = 'email'
				,pass_field = 'password'
				,post_user = 'username'
				,post_pass = 'password'
				,hash_function = 'md5'):
		user_name = self.request.POST[post_user]
		password =  self.request.POST[post_pass]
		user = DBSession.query(User).filter_by(email=user_name).first()
		try:
			if(user.password == password):
				session_id = self.save_in_session('user_id',user.id)
				self.request.response.set_cookie(SESSION_NAME, session_id,max_age=None,path='/')
				return "success"
			else:
				return "pass" 
		except Exception, e:
			return "username"
	
	def generateRandomString(self,length = 10):
		characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		randomString = '';
		for i in range(length):
			randomString = randomString + characters[random.randint(0,len(characters) - 1)]
		return randomString
	
	def read_session_key(self,key):
		try:
			session_id = self.request.cookies[SESSION_NAME]
			session = DBSession.query(Session).filter_by(session_id=session_id).first()
			try:
				data = phpserialize.loads(session.data,array_hook=OrderedDict)
				try:
					return data[key]
				except Exception, e:
					return False
			except Exception, e:
				print e
				return False
		except Exception, e:
			return False
			
	def read_session(self):
		try:
			session_id = self.request.cookies[SESSION_NAME]
			session = DBSession.query(Session).filter_by(session_id=session_id).first()
			try:
				session.data = phpserialize.loads(session.data,array_hook=OrderedDict)
				return session
			except Exception, e:
				return False
		except Exception, e:
			return False
			
	def read_session_data(self):
		try:
			session_id = self.request.cookies[SESSION_NAME]
			session = DBSession.query(Session).filter_by(session_id=session_id).first()
			try:
				session.data = phpserialize.loads(session.data,array_hook=OrderedDict)
				return session.data
			except Exception, e:
				return False
		except Exception, e:
			return False
	def verify_login(self):
		try:
			session_id = self.request.cookies[SESSION_NAME]
			session = DBSession.query(Session).filter_by(session_id=session_id).first()
			try:
				return session.session_id
			except Exception, e:
				return False
		except Exception, e:
			return False
				
	def update_session(self,key,value):
		session_id = self.request.cookies[SESSION_NAME]
		data = self.read_session_data()
		data[key] = value
		session = DBSession.query(Session).filter_by(session_id=session_id).update({'data':pickle.dumps(data)})
		return session_id
	
	def insert_session(self,var,value):
		session_id = self.generateRandomString(20);
		data = {}
		data[var] = value;
		data2 = pickle.dumps(data)
		#data3 = data2.decode('utf-8')
		session = Session(session_id = session_id,data = data2)
		DBSession.add(session)
		return session_id;
	
	def save_in_session(self,var,value):
		session = self.read_session();
		if(session):
			return self.update_session(var,value)
		else:
			return self.insert_session(var,value)
	
	def delete_session(self,session_id):
		session = DBSession.query(Session).filter_by(session_id=session_id).delete()
	