from pyramid.renderers import get_renderer
from pyramid_handlers import action
from pyramid.response import Response
from pyramid.decorator import reify
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
import webhelpers.paginate
from layouts import Layouts
from main import Main
#from einvoices.library.main import (
	#main,
#)
BASE_TMPL = 'einvoices:templates/'

from sqlalchemy.exc import DBAPIError
from einvoices.vmodels.vuser import (
    vUser,
    )
	
from einvoices.vmodels.vcompany import (
    vDBSession,
    vCompany,
    )

class ProjectorCompanies(Main):
	
        def __init__(self, request):
		self.config_view_name = 'companies'
		super(ProjectorCompanies,self).__init__(request)
		
	@action(renderer=BASE_TMPL  + "companies/index.pt")
	def index(self):
		#self.insertdb()
		msj = self.message();
		companies = vDBSession.query(vCompany)
		pages = webhelpers.paginate.Page(companies, page=self.request.GET.get('p',1), items_per_page=20)
		users = vDBSession.query(vUser)
		_pagination = self._pagination(pages)
		return {'users':users,'companies':pages,'msj':msj,'pagination':_pagination}
		
	@action(renderer=BASE_TMPL  + "companies/edit.pt")
	def edit(self):
		msj = self.message();
		companies = vDBSession.query(vCompany)
		company_id = self.request.matchdict['id']
		entry = vDBSession.query(Company).filter_by(id=company_id).first()
		page = webhelpers.paginate.Page(companies, page=2, items_per_page=30)
		users = DBSession.query(vUser)
		_pagination = self._pagination(page)
		return {'entry':entry
			,'companies':page
			,'users':users.all()
			,'msj':msj
			,'pagination':_pagination
		}
	
	@action(renderer=BASE_TMPL  + "companies/list.pt")
	def filter(self):
		companies = vDBSession.query(Company)
		page = webhelpers.paginate.Page(companies, page=self.request.GET.get('p',1), items_per_page=20)
		_pagination = self._pagination(page)
		return {'companies':page,'pagination':_pagination}
	
	@reify
	def companies_list(self):
		renderer = get_renderer(BASE_TMPL  + "companies/list.pt")
		return renderer.implementation().macros
		
	@action()
	def create(self):
		user = self.generateRandomString(5)
		password = self.generateRandomString(10)
		company = vCompany(
				 name = self.request.POST['name']
				,rfc = self.request.POST['rfc']
				,address = self.request.POST['address']
				,cp = self.request.POST['cp']
				,corporateName = self.request.POST['corporateName']
				,curp = self.request.POST['curp']
				,telephone = self.request.POST['telephone']
				,legalRepresentative = self.request.POST['legalRepresentative']
				,positionlegalRepresentative = self.request.POST['positionlegalRepresentative']
				,rfcLegalRepresentative = self.request.POST['rfcLegalRepresentative']
				,curpLegalRepresentative = self.request.POST['curpLegalRepresentative']
				,idLegalRepresentative = self.request.POST['idLegalRepresentative']
				,emailLegalRepresentative = self.request.POST['emailLegalRepresentative']
				,datasLegalRepresentative = self.request.POST['datasLegalRepresentative']
				,taxRegime = self.request.POST['taxRegime']
				,labourSystem = self.request.POST['labourSystem']
				,financialInformation = self.request.POST['financialInformation']
				,supervise = self.request.POST['supervise']
				,ciecKey = self.request.POST['ciecKey']
				,fielKey = self.request.POST['fielKey']
				,imssKey = self.request.POST['imssKey']
				,digitalSignature = self.request.POST['digitalSignature']
				,accountNumber = self.request.POST['accountNumber']
				,start_date = self.request.POST['start_date']
				,end_date = self.request.POST['end_date']
				,services = self.request.POST['services']
				,user = user
				,password = password
				,tenant_id = user
			)
		vDBSession.add(company)
		self.create_user(user,password)
		return HTTPFound(location='/companies/m=ric')

	def create_user(self,user,password):
		query = "CREATE USER "+ user + "@localhost IDENTIFIED BY '" + password + "'"
		vDBSession.execute(query)

		query = "GRANT SELECT, INSERT, UPDATE, DELETE, TRIGGER, SHOW VIEW, EXECUTE ON einvoices.* TO  " + user + "@'localhost'"
		vDBSession.execute(query)

		query = "FLUSH PRIVILEGES";
		vDBSession.execute(query)		
		
	@action()
	def update(self):
		company = vDBSession.query(Company).filter_by(id=self.request.POST['company_id']).update({
													 'name': self.request.POST['name']
													,'rfc': self.request.POST['rfc']
													,'address': self.request.POST['address']
													,'cp': self.request.POST['cp']
													,'corporateName': self.request.POST['corporateName']
													,'curp': self.request.POST['curp']
													,'telephone': self.request.POST['telephone']
													,'legalRepresentative': self.request.POST['legalRepresentative']
													,'positionlegalRepresentative': self.request.POST['positionlegalRepresentative']
													,'rfcLegalRepresentative': self.request.POST['rfcLegalRepresentative']
													,'curpLegalRepresentative': self.request.POST['curpLegalRepresentative']
													,'idLegalRepresentative': self.request.POST['idLegalRepresentative']
													,'emailLegalRepresentative': self.request.POST['emailLegalRepresentative']
													,'datasLegalRepresentative': self.request.POST['datasLegalRepresentative']
													,'taxRegime': self.request.POST['taxRegime']
													,'labourSystem': self.request.POST['labourSystem']
													,'financialInformation': self.request.POST['financialInformation']
													,'supervise': self.request.POST['supervise']
													,'ciecKey': self.request.POST['ciecKey']
													,'fielKey': self.request.POST['fielKey']
													,'imssKey': self.request.POST['imssKey']
													,'digitalSignature': self.request.POST['digitalSignature']
													,'accountNumber': self.request.POST['accountNumber']
													,'start_date': self.request.POST['start_date']
													,'end_date': self.request.POST['end_date']
													,'services': self.request.POST['services']
													})
		return HTTPFound(location='/companies/m=rec')
	
	@action()
	def delete(self):
		company_id = self.request.matchdict['id'] 
		company = DBSession.query(Company).filter_by(id=company_id).delete()
		return HTTPFound(location='/companies/m=rdc')
				