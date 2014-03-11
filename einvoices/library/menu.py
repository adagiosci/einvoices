SITE_MENU = [
        {
		'title': 'Catalogos','groups':['group:Cliente'],
		'children':[
			{'view':'units','href': '/unidades', 'title': 'Unidades','groups':['group:Cliente'],
				'children': [
					{'title':'Crear','href':'/unidades/create'},
					{'title':'Actualizar','href':'/unidades/update'},
					{'title':'Eliminar','href':'/unidades/delete'}
				]
			},
			{'view':'suppliers','href': '/suppliers', 'title': 'Provedores','groups':['group:Cliente'],
				'children': [
					{'title':'Crear','href':'/suppliers/create'},
					{'title':'Actualizar','href':'/suppliers/update'},
					{'title':'Eliminar','href':'/suppliers/delete'}
				]			
			},
			{'view':'clients','href': '/clients', 'title': 'Clientes','groups':['group:Cliente'],
				'children': [
					{'title':'Crear','href':'/clients/create'},
					{'title':'Actualizar','href':'/clients/update'},
					{'title':'Eliminar','href':'/clients/delete'}
				]			
			},
			{'view':'sucursales','href': '/sucursales', 'title': 'sucursales','groups':['group:Cliente'],
				'children': [
					{'title':'Crear','href':'/sucursales/create'},
					{'title':'Actualizar','href':'/sucursales/update'},
					{'title':'Eliminar','href':'/sucursales/delete'}
				]			
			},
			{'view':'monedas','href': '/monedas', 'title': 'Monedas','groups':['group:Cliente'],
				'children': [
					{'title':'Crear','href':'/monedas/create'},
					{'title':'Actualizar','href':'/monedas/update'},
					{'title':'Eliminar','href':'/monedas/delete'}
				]			
			},			
		]
	},
	{
		'title':'Configuraciones','groups':['group:Cliente','group:Admin'],
		'children':[
			{'view':'users','href': '/users', 'title': 'Usuarios','groups':['group:Cliente','group:Admin'],
				'children': [
					{'title':'Crear', 'href':'/users/create'},
					{'title':'Actualizar','href':'/users/update'},
					{'title':'Eliminar','href':'/users/delete'}]			
			},
			{'view':'companies','href': '/companies', 'title': 'Empresas','groups':['group:Admin'],
				'children': [
					{'title':'Crear','href':'/companies/create'},
					{'title':'Actualizar','href':'/companies/update'},
					{'title':'Eliminar','href':'/companies/delete'}]			
			},
			{'view':'companies','href': '/companies/edit', 'title': 'Empresa','groups':['group:Cliente'],
				'children': [
					{'title':'Crear','href':'/companies/create'},
					{'title':'Actualizar','href':'/companies/update'},
					{'title':'Eliminar','href':'/companies/delete'}
				]			
			},
			{'view':'password','href':'/users/password','title':'Contrasena','groups':['group:Cliente','group:Admin'],
				'children': [
					{'title':'Actualizar','href':'/users/changepassword'}
				]			
			},
		]
	},
] 