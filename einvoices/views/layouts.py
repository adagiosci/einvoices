from pyramid.renderers import get_renderer
from pyramid.decorator import reify

BASE_TMPL = 'einvoices:templates/'

class Layouts(object):
    @reify
    def global_template(self):
        renderer = get_renderer(BASE_TMPL  + "global_layout.pt")
        return renderer.implementation().macros['layout']
        
    @reify
    def global_macros(self):
        renderer = get_renderer(BASE_TMPL  + "menu.pt")
        return renderer.implementation().macros