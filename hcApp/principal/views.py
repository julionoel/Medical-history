from django.contrib.auth.models import User
from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response, redirect, HttpResponse, get_object_or_404
from django.template import RequestContext
from principal.forms import HistorialForm, NotaForm
from principal.models import Historial, Nota
from principal.util import get_query, ultimos5historialesActivas,historialesActivasMAX,\
	historialesActivasQuery, notasHistorialActivas, antecedentesHistorialActivas,\
	otrosHistorialActivas, intervencionesHistorialActivas
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required

#Variables 

MAX = 15 #Número máximos de registros mostrados en el buscar

#********************************************************
def user_login(request):
	if request.user.is_authenticated():
		return redirect('/inicio/')
	error = None
	if request.method == 'POST':
		username = request.POST['username']
		password = request.POST['password']
		user = authenticate(username=username, password=password)
		if user is not None:
			if user.is_active:
				login(request, user)
				try:
					if user.get_profile() is None:
						logout(request)
						error = "No se puede loguear porque no tiene un horario definido aun"
					else:
						return redirect(to='/inicio')
				except Exception:
					logout(request)
					error = "No se detecta el tipo de cuenta, asegurate de tener un perfil"
					
		else:
			logout(request)
			error = 'Usuario o contraseña incorrecto. Por favor intente de nuevo'
	
	return render_to_response('login.html', {'error': error}, context_instance=RequestContext(request))


def user_logout(request):
	logout(request)
	return redirect(to='/login/')

@login_required(login_url='/login/')
def inicio(request):
	historias = ultimos5historialesActivas();
	return render_to_response('inicio.html',{'lista':historias},context_instance=RequestContext(request))


@login_required(login_url='/login/')
def lista_historiales(request):
	return render_to_response('lista_historiales.html',context_instance=RequestContext(request))

@login_required(login_url='/login/')
def buscar(request):
	campos=('dni','nombre','apellido1','apellido2')
	cont = None
	lista = None
	
	if ('q' in request.GET) and request.GET['q'].strip():
		query = request.GET.get('q', '')
		entry_query = get_query(query, campos)
		lista = historialesActivasQuery(entry_query,MAX)
		
	else:
		lista = historialesActivasMAX(MAX)
	
	return render_to_response('lista_historiales.html',{'lista':lista,'cont': cont,'MAX': MAX},context_instance=RequestContext(request))

@login_required(login_url='/login/')
def cuentaUsuario(request):
	usuario = User
	return render_to_response('account.html',{'usuario':usuario},context_instance=RequestContext(request))

def vistaError(request):
	return render_to_response('error.html',context_instance=RequestContext(request))


@login_required(login_url='/login/')
def detalleHistorial(request,dni):
	historial = get_object_or_404(Historial, dni = dni)
	notas = notasHistorialActivas(historial)
	antecedentes = antecedentesHistorialActivas(historial)
	intervenciones = intervencionesHistorialActivas(historial)
	otros = otrosHistorialActivas(historial)
	form = NotaForm()
		
	tipoNota = None		
	if "tipoNota" in request.session:
		tipoNota = request.session["tipoNota"]	
		del request.session["tipoNota"]
		
	#adjuntoForm = AdjuntoForm()	
	adjuntoForm = None	
	return render_to_response('detalleHistorial.html',{'historial':historial,'notas':notas,'antecedentes':antecedentes,'intervenciones':intervenciones,'otros':otros,'notasForm':form,'tipoNota':tipoNota,'adjuntoForm':adjuntoForm},context_instance=RequestContext(request))# Create your views here. 

@login_required(login_url='/login/')
def editarHistorial(request,dni):
	historial = get_object_or_404(Historial, dni = dni)
	return render_to_response('editarHistorial.html',{'historial':historial},context_instance=RequestContext(request))# Create your views here. 


@login_required(login_url='/login/')	
def editHistorial(request):
	errors = None
	
	dni= request.POST.get("dni")
	instance = Historial.objects.get(dni=dni)
	form = HistorialForm(request.POST or None, instance=instance)
	if form.is_valid():
		form.save()
		return HttpResponseRedirect('/detalleHistorial/'+dni)
	else:
		errors = form.errors
		print(errors)
		historial = HistorialForm()
	return render_to_response('editarHistorial.html',{'historial':instance,'errors': errors},context_instance = RequestContext(request))

@login_required(login_url='/login/')	
def nuevoHistorial(request):
	errors = None
	if request.method=='POST':
		historial = HistorialForm(request.POST, request.FILES)
		dni= request.POST.get("dni")
		
		if historial.is_valid():
 			historial.save();
			return HttpResponseRedirect('/detalleHistorial/'+dni)
		else:
			errors = historial.errors
			print(errors)
		
	else:
		historial = HistorialForm()
	return render_to_response('nuevoHistorial.html',{'historial':historial,'errors': errors},context_instance = RequestContext(request))

@login_required(login_url='/login/')	
def borrarHistorial(request,dni):
	
	
	historial = get_object_or_404(Historial,dni=id)
	if(historial):
		historial.activo = 0
		historial.save()
		return HttpResponseRedirect('/detalleHistorial/'+dni)
	
	return render_to_response('detalleHistorial.html', context_instance=RequestContext(request))


@login_required(login_url='/login/')	
def nuevaNota(request):
	if request.method=='POST':
		form = NotaForm(request.POST, request.FILES)
		dni= request.POST.get("dni")
				
		if form.is_valid():
			form.save()
			request.session["tipoNota"] = request.POST.get("tipo")
			return HttpResponseRedirect('/detalleHistorial/'+dni)
		else:
			form = NotaForm()
	return render_to_response('detalleHistorial.html',{'notasForm':form}, context_instance=RequestContext(request))	

@login_required(login_url='/login/')	
def editNota(request):
	if request.method=='POST':
		
		dni= request.POST.get("dni")
		id= request.POST.get("idNota")
		texto= request.POST.get("texto")
		nota = get_object_or_404(Nota,id=id)
			
		if(nota):
			nota.texto = texto
			nota.save()
			request.session["tipoNota"] = nota.tipo
			return HttpResponseRedirect('/detalleHistorial/'+dni)
	
	return render_to_response('detalleHistorial.html',context_instance=RequestContext(request))	


@login_required(login_url='/login/')	
def borraNota(request,dni,id):
	
	nota = get_object_or_404(Nota,id=id)
	if(nota):
		nota.activo = 0
		nota.save()
		request.session["tipoNota"] = nota.tipo
		return HttpResponseRedirect('/detalleHistorial/'+dni)
	
	return render_to_response('detalleHistorial.html', context_instance=RequestContext(request))	

@login_required(login_url='/login/')	
def upload_file(request):
    if request.method == 'POST':
        form = UploadFileForm(request.POST, request.FILES)
        if form.is_valid():
            handle_uploaded_file(request.FILES['file'])
            return HttpResponseRedirect('/success/url/')
    else:
        form = UploadFileForm()
    return render_to_response('upload.html', {'form': form})
	

#********************************************************


	
