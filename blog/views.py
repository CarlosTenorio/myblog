from django.shortcuts import render
from blog.models import Post
from django.utils import timezone


def post_list(request):
    posts = Post.objects.all().order_by('published_date')
    return render(request, 'post_list.html', { 'posts': posts })
