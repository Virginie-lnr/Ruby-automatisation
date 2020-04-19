# create a new folder : 
# alias = magicruby

def check_if_user_gave_input
    abort("mkdir: please enter the name of the file you wish to create like that : mkdiruby name_of_folder") if ARGV.empty?
end

def get_folder_name
    return folder_name = ARGV.first
end

def create_folder(name)
    Dir.mkdir(name)
    Dir.mkdir("#{name}/lib")
end

def create_gemfile(name)
    file = File.open("#{name}/Gemfile", "a")
    file.puts("source 'https://rubygems.org'
    ruby '2.5.1'
    gem 'rspec'
    gem 'pry'
    gem 'rubocop', '~> 0.57.2'
    gem 'dotenv'
    gem 'nokogiri'")
    file.close

    file = File.open("#{name}/Gemfile", "r")
    puts "Voici le contenu de ton Gemfile :"
    puts file.read
    file.close
end

def create_file_env_and_gitignore(name)
    file = File.open("#{name}/.env", "a")
    file.close
    file = File.open("#{name}/.gitignore", "a")
    file.puts(".env")
    file.close
end

def git_init(name)
    system("git init #{name}")
end

def rspec_init
    system("rspec --init")
end

def create_readme(name)
    file = File.open("#{name}/README.md", "a")
    file.puts("Je suis un bot Ruby qui permet de créer un dossier comportant les éléments suivants : 
Création d'un dossier qui porte le nom de l'ARGV de l'utilisateur
Si l'utilisateur ne rentre pas de ARGV ou s'il rentre un ARGV avec plusieurs mots, le programme dit à l'utilisateur comment s'en servir et s'arrêter
Création du Gemfile avec les gems de THP
Création du fichier .env, qui se trouve dans le fichier gitignore
Création du dossier lib
Git init
rspec --init")
    file.close
end
  
def perform 
  folder_name = get_folder_name
  check_if_user_gave_input
  create_folder(folder_name)
  puts "Le dossier #{folder_name} a bien été créé"
  create_gemfile(folder_name)
  create_file_env_and_gitignore(folder_name)
  git_init(folder_name)
  rspec_init
  create_readme(folder_name)
end

perform



