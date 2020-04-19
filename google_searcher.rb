# program to search on google.com from the terminal
# alias = search

def check_if_user_gave_input
  abort("mkdir: please enter your research") if ARGV.empty?
end

def get_search 
  return search = ARGV.first
end

def search_on_google(search)
  return system("open", "https://www.google.fr/search?q=#{search}")
end

def perform 
  check_if_user_gave_input
  search_on_google(get_search)
end

perform