atom_feed do |feed|
  feed.title "Scratch It Off To-do Lists"
  feed.updated @lists

  for @post.each in @list.each do |list|
    feed.entry(list) 
    list.title
    list.body, :type => 'html'
  end
end

    