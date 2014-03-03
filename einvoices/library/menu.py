SITE_MENU = [
        {
		'title': 'Catalogos','groups':['group:Cliente'],
		'children':[
			{'view':'units','href': '/unidades', 'title': 'Unidades','groups':['group:Cliente'],
				'children': [{
					'title':'Crear',
					'title':'Leer',
					'title':'Actualizar',
					'title':'Eliminar'
				}]
			},
			{'view':'suppliers','href': '/suppliers', 'title': 'Provedores','groups':['group:Cliente']},
			{'view':'clients','href': '/clients', 'title': 'Clientes','groups':['group:Cliente']},
			{'view':'sucursales','href': '/sucursales', 'title': 'sucursales','groups':['group:Cliente']},
		]
	},
	{
		'title':'Configuraciones','groups':['group:Cliente','group:Admin'],
		'children':[
			{'view':'users','href': '/users', 'title': 'Usuarios','groups':['group:Cliente']},
			{'view':'companies','href': '/companies', 'title': 'Empresas','groups':['group:Admin']},
			{'view':'companies','href': '/companies/edit', 'title': 'Empresa','groups':['group:Cliente']},
			{'view':'password','href':'/users/password','title':'Contrasena','groups':['group:Cliente']},
		]
	},
] 