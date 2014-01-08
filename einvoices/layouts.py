from pyramid.renderers import get_renderer
from pyramid.decorator import reify

#from dummy_data import COMPANY
#from dummy_data import SITE_MENU

class Layouts(object):
    @reify
    def global_template(self):
        renderer = get_renderer("templates/global_layout.pt")
        return renderer.implementation().macros['layout']
        
    @reify
    def global_macros(self):
        renderer = get_renderer("templates/menu.pt")
        return renderer.implementation().macros