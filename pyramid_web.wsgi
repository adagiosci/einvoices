from pyramid.paster import get_app, setup_logging
ini_path='/home/irving/tutorial_workspace/einvoices/development.ini'
setup_logging(ini_path)
application = get_app(ini_path, 'main')