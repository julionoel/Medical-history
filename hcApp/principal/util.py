# -*- coding: UTF-8 -*-
# Utilidades


import re
from django.core.mail import EmailMultiAlternatives
from django.db.models import Q
from principal.models import Historial, Nota
from django.shortcuts import get_object_or_404


def normalize_query(query_string,
                    findterms=re.compile(r'"([^"]+)"|(\S+)').findall,
                    normspace=re.compile(r'\s{2,}').sub):
    ''' Splits the query string in invidual keywords, getting rid of unecessary spaces
        and grouping quoted words together.
        Example:
        
        >>> normalize_query('  some random  words "with   quotes  " and   spaces')
        ['some', 'random', 'words', 'with quotes', 'and', 'spaces']
    
    '''
    return [normspace(' ', (t[0] or t[1]).strip()) for t in findterms(query_string)] 

def get_query(query_string, search_fields):
    ''' Returns a query, that is a combination of Q objects. That combination
        aims to search keywords within a model by testing the given search fields.
    
    '''
    query = None # Query to search for every search term        
    terms = normalize_query(query_string)
    for term in terms:
        or_query = None # Query to search for a given term in each field
        for field_name in search_fields:
            q = Q(**{"%s__icontains" % field_name: term})
            if or_query is None:
                or_query = q
            else:
                or_query = or_query | q
        if query is None:
            query = or_query
        else:
            query = query & or_query
    return query

def enviar_mail(asunto, texto, de, para, html = None):
    msg = EmailMultiAlternatives(asunto, texto, de, para) # Para debe ser una lista de direcciones
    if html:
        msg.attach_alternative(html, "text/html")
    msg.send(fail_silently=True)



def ultimos5historialesActivas():
    historias = Historial.objects.filter(Q(activo=True)).order_by('-fechaApertura')[:5]
    return historias

def historialesActivasMAX(MAX):
    historias = Historial.objects.filter(Q(activo=True)).order_by('-fechaApertura')[:MAX]
    return historias

def historialesActivasQuery(entry_query,MAX):
    
    historias = Historial.objects.filter(entry_query,Q(activo=True)).order_by('-fechaApertura')[:MAX]
    
    return historias

def notasHistorialActivas(historial):
    notas = Nota.objects.filter(historial=historial).filter(Q(tipo=1)).exclude(activo=False).order_by('-fecha')
    return notas

def antecedentesHistorialActivas(historial):
    notas = Nota.objects.filter(historial=historial).filter(Q(tipo=2)).exclude(activo=False).order_by('-fecha')
    return notas

def intervencionesHistorialActivas(historial):
    notas = Nota.objects.filter(historial=historial).filter(Q(tipo=3)).exclude(activo=False).order_by('-fecha')
    return notas

def otrosHistorialActivas(historial):
    notas = Nota.objects.filter(historial=historial).filter(Q(tipo=4)).exclude(activo=False).order_by('-fecha')
    return notas


