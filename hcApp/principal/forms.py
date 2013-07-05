from django import forms
from django.forms import ModelForm
from principal.models import Historial, Nota

from django.contrib.admin import widgets

class HistorialForm(ModelForm):
    
    #dni = forms.CharField(error_messages = {'required': "Campo obligatorio"})
    #nombre = forms.CharField(error_messages = {'required': "Campo obligatorio"})  
   # apellido2 = forms.CharField(error_messages = {'required': "Campo obligatorio"})  
   # apellido1 = forms.CharField(error_messages = {'required': "Campo obligatorio"}) 
    #fechaNacimiento = forms.DateField(input_formats=['%m/%d/%y'])   
    #widget=forms.DateInput(format = '%d.%m.%Y'), input_formats=('%d.%m.%Y',))
    
    #activo = forms.BooleanField()
    #activo = forms.BooleanField(initial=True)

                                           
    class Meta:
        model = Historial
        fields = ('dni','nombre','apellido1','apellido2','fechaNacimiento','sexo','telefono','profesion','compania','autor') 
       
        
            
class NotaForm(ModelForm):
    
    texto = forms.CharField(widget=forms.Textarea(attrs={'cols': 80, 'rows': 20}))
    
    class Meta:
        model = Nota
        fields = ('texto','historial','autor','tipo') 
        
class UploadFileForm(forms.Form):
    title = forms.CharField(max_length=50)
    file  = forms.FileField()
        




