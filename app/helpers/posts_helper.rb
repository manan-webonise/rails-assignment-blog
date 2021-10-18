module PostsHelper
  def post_status(post)
    post.ispublished ? 'Unpublish' : 'Publish'
  end
end
