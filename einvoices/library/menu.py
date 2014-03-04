SITE_MENU = [
        {
		'title': 'Catalogos','groups':['group:Cliente'],
		'children':[
			{'view':'units','href': '/unidades', 'title': 'Unidades','groups':['group:Cliente'],
				'children': [
					{'title':'Crear'},
					{'title':'Actualizar'},
					{'title':'Eliminar'}
				]
			},
			{'view':'suppliers','href': '/suppliers', 'title': 'Provedores','groups':['group:Cliente'],
				'children': [
					{'title':'Crear'},
					{'title':'Actualizar'},
					{'title':'Eliminar'}
				]			
			},
			{'view':'clients','href': '/clients', 'title': 'Clientes','groups':['group:Cliente'],
				'children': [
					{'title':'Crear'},
					{'title':'Actualizar'},
					{'title':'Eliminar'}
				]			
			},
			{'view':'sucursales','href': '/sucursales', 'title': 'sucursales','groups':['group:Cliente'],
				'children': [
					{'title':'Crear'},
					{'title':'Actualizar'},
					{'title':'Eliminar'}
				]			
			},
		]
	},
	{
		'title':'Configuraciones','groups':['group:Cliente','group:Admin'],
		'children':[
			{'view':'users','href': '/users', 'title': 'Usuarios','groups':['group:Cliente','group:Admin'],
				'children': [{'title':'Crear', 'href':'/users'},{'title':'Actualizar'},{'title':'Eliminar'}]			
			},
			{'view':'companies','href': '/companies', 'title': 'Empresas','groups':['group:Admin'],
				'children': [{'title':'Crear'},{'title':'Actualizar'},{'title':'Eliminar'}]			
			},
			{'view':'companies','href': '/companies/edit', 'title': 'Empresa','groups':['group:Cliente'],
				'children': [
					{'title':'Crear'},
					{'title':'Actualizar'},
					{'title':'Eliminar'}
				]			
			},
			{'view':'password','href':'/users/password','title':'Contrasena','groups':['group:Cliente','group:Admin'],
				'children': [
					{'title':'Crear'},
					{'title':'Actualizar'},
					{'title':'Eliminar'}
				]			
			},
		]
	},
] 