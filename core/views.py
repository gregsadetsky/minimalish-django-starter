from django.shortcuts import render


def index(request):
    return render(request, "core/index.html")


def index_react(request):
    return render(request, "core/index_react.html")
