from django.db import models 
from django.contrib.auth.models import User 
from django.utils.datetime_safe import datetime
from django.template.defaultfilters import default




class Historial(models.Model):
	GENERO = [(0, 'Masculino'), (1, 'Femenino')]
	COMPANIA = [(0, 'Adeslas'), (1, 'Caser')]
	
	
	dni = models.CharField(unique = True,max_length=14, verbose_name='DNI:')
	nombre = models.CharField(max_length=50)
	apellido1 = models.CharField(max_length=50)
	apellido2 = models.CharField(max_length=50)
	fechaNacimiento = models.DateField(blank=True,null=True)
	sexo = models.IntegerField(choices=GENERO,blank=True,null=True)
	
	telefono = models.IntegerField(blank=True,null=True)
	profesion = models.CharField(max_length=50,blank=True,null=True)
	numAfilicacion = models.IntegerField(blank=True,null=True)
	compania = models.IntegerField(choices=COMPANIA,blank=True,null=True)
	fechaApertura = models.DateTimeField(auto_now=True,blank=True)
	autor = models.ForeignKey(User, blank=True, null=True)
	activo = models.BooleanField(default=True)
	
	def __unicode__(self):
		return self.nombre + " " + self.apellido1 + " " + self.apellido2 
	
	def edad(self):
		diff = (datetime.today() - self.fechaNacimiento).days
		years = str(int(diff/365))
		return years
	
	def is_propietario(self,request):
		return self.user == request.user
		
	
class Nota(models.Model):
	TIPO_NOTAS = [(1, 'Notas'), (2, 'Antecedentes'), (3, 'Intervenciones'), (4, 'Otros'),(5, 'Adjuntos')]
	
	historial = models.ForeignKey(Historial)
	texto = models.TextField()
	fecha = models.DateTimeField(auto_now=True,blank=True)
	autor = models.ForeignKey(User, blank=True, null=True, verbose_name=('Autor'))
	tipo = models.IntegerField(choices=TIPO_NOTAS,default=1)
	activo = models.BooleanField(default=True)
	adjunto = models.FileField(upload_to='adjuntos',verbose_name='adjunto')


#Perfil de usuario del sistema
class Perfil(models.Model):
	user = models.OneToOneField(User)
	dni = models.CharField(max_length=8)
	telefono = models.CharField(max_length=9, null=True, blank=True)
	

	def __unicode__(self):
		return self.user.__unicode__()
	
	def is_secre(self):
		return self.user in User.objects.filter(groups__name='secre')

	def is_doctor(self):
		return self.user in User.objects.filter(groups__name='doctor')

	def is_admin(self):
		return self.user in User.objects.filter(groups__name='admin')

