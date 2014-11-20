atom_feed do |feed|
  feed.title "Scratch It Off To-do Lists"
  feed.updated @lists

  for @post.each in @list.each do 
    feed.entry(list) 
    post.title
    post.body
  end
end

    