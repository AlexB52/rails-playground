# This script creates a comment

Comment.create!(
  title: 'a comment title',
  body: 'a comment body',
  article: Article.last
)