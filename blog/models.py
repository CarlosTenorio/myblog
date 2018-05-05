from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

class Post(models.Model):
    author = models.ForeignKey(User, related_name="user_post",
        on_delete=models.PROTECT, verbose_name='Autor')
    title_en = models.CharField(max_length=200, null=True, blank=True)
    title_es = models.CharField(max_length=200, null=True)
    preview_en = models.TextField(blank=True)
    preview_es = models.TextField(default="")
    text_en = models.TextField(blank=True)
    text_es = models.TextField(default="")
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)
    image = models.ImageField(upload_to='posts/', blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title_es
