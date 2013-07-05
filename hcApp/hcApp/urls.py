from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.contrib.auth.views import login, logout


admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$','principal.views.user_login'),
    url(r'^login/$', 'principal.views.user_login'),
    url(r'^logout/$', 'principal.views.user_logout'),
    #url(r'^$','principal.views.inicio'),
    url(r'^inicio/$', 'principal.views.inicio'),
	url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^historiales/$','principal.views.lista_historiales'),
    url(r'^nuevoHistorial/$','principal.views.nuevoHistorial'),
    url(r'^buscar/$', 'principal.views.buscar'),
    url(r'^cuentaUsuario/$','principal.views.cuentaUsuario'),
    url(r'^error','principal.views.vistaError'),
    #url(r'^detalleHistorial/(?P<dni>\d+)$','principal.views.detalleHistorial'),
    url(r'^detalleHistorial/(?P<dni>[^\.]+)/$','principal.views.detalleHistorial'),
    url(r'^modificarHistorial/$','principal.views.editHistorial'),
    url(r'^editarHistorial/(?P<dni>[^\.]+)/$','principal.views.editarHistorial'),
    url(r'^eliminarHistorial/(?P<dni>[^\.]+)/$','principal.views.borrarHistorial'),
    url(r'^nuevaNota/$','principal.views.nuevaNota'),
    url(r'^adjuntaNota/$','principal.views.upload_file'),
    url(r'^borrarNota/(?P<dni>[^\.]+)/(?P<id>[^\.]+)/$','principal.views.borraNota'),
    url(r'^editarNota/$','principal.views.editNota'),
      
      
)


