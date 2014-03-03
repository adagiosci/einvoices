SITE_MENU = [
        {
		'title': 'Catalogos','permission':'view',
		'children':[
			{'view':'units','href': '/unidades', 'title': 'Unidades','permission':'view','groups':['group:Cliente']},
			{'view':'suppliers','href': '/suppliers', 'title': 'Provedores','permission':'view','groups':['group:Cliente']},
			{'view':'clients','href': '/clients', 'title': 'Clientes','permission':'view','groups':['group:Cliente']},
			{'view':'sucursales','href': '/sucursales', 'title': 'sucursales','permission':'view','groups':['group:Cliente']},
		]
	},
	{
		'title':'Configuraciones','permission':'view',
		'children':[
			{'view':'users','href': '/users', 'title': 'Usuarios','permission':'view','groups':['group:Cliente']},
			{'view':'companies','href': '/companies', 'title': 'Empresas','permission':'view','groups':['group:Admin']},
			{'view':'companies','href': '/companies/edit', 'title': 'Empresa','permission':'view','groups':['group:Cliente']},
			{'view':'password','href':'/users/password','title':'Contrasena','permission':'view','groups':['group:Cliente']},
		]
	},
] 