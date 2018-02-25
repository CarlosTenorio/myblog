from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from blog.models import Post

# Get all published post to show the preview
def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'post_list.html', { 'posts': posts })

# Get the post detail info to show only this post
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'post_detail.html', {'post': post})
