def path_to(page_name)
  case page_name

  when /the homepage/
    # Include a cache busting param
    root_path(:_ => Random.rand(1000000000))
  else
    raise "Can't find mapping from \"#{page_name}\" to a path."
  end
end