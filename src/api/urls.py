from django.urls import include, path
from rest_framework.routers import DefaultRouter

from api import views

router = DefaultRouter()
router.register(r"users", views.UserViewSet)
router.register(r"todolists", views.TodoListViewSet)
router.register(r"todos", views.TodoViewSet)

app_name = "api"

urlpatterns = [
    path("", include(router.urls)),
    # Додаємо Health Checks поза роутером, бо це не ресурси бази даних
    path('health/live/', views.liveness_check, name='liveness'),
    path('health/ready/', views.readiness_check, name='readiness'),
]
