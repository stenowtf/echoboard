atom_feed do |feed|
  feed.title "Projects"
  feed.updated Project.maximum(:updated_at)

  @projects.each do |project|
    feed.entry project, published: project.created_at do |entry|
      entry.title project.name
      entry.content project.description
      entry.author "echoboard user"
    end
  end
end