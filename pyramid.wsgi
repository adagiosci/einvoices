from pyramid.paster import get_app, setup_logging
import monitor
monitor.start(interval=1.0)
ini_path='/home/irving/tutorial_workspace/einvoices/development.ini'
setup_logging(ini_path)
application = get_app(ini_path, 'main')