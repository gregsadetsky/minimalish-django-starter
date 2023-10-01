from django.urls import path

urlpatterns = [
    path(
        "",
        "core.views.index",
        name="index",
    ),
]
