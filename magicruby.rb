# create a new folder : 
# alias = magicruby
require 'fileutils'

def check_if_user_gave_input
    abort("mkdir: please enter the name of the file you wish to create like that : mkdiruby name_of_folder") if ARGV.empty?
end

def get_folder_name
    return folder_name = ARGV.first
end

def create_folder(name)
    Dir.mkdir(name)
    Dir.mkdir("#{name}/lib")
    Dir.mkdir("#{name}/lib/app")
    Dir.mkdir("#{name}/lib/views")   
    Dir.mkdir("#{name}/db")
end

def create_file_inside_views_folder(name)
    file = File.open("#{name}/lib/views/index.rb", "a")
    file.close 

    file = File.open("#{name}/lib/views/done.rb", "a")
    file.close
end

def create_gemfile(name)
    file = File.open("Gemfile", "a")
    file.puts("source 'https://rubygems.org'
    ruby '2.5.1'
    gem 'rspec'
    gem 'pry'
    gem 'rubocop', '~> 0.57.2'
    gem 'dotenv'
    gem 'nokogiri'")
    file.close

    file = File.open("Gemfile", "r")
    puts "Voici le contenu de ton Gemfile :"
    puts file.read
    file.close
end

def move_gemfile(name)
    system("bundle install")
    FileUtils.mv ("Gemfile"), ("#{name}")
    FileUtils.mv ("Gemfile.lock"), ("#{name}")
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

def rspec_init(name)
    system("rspec --init")
    FileUtils.mv ("spec"), ("#{name}") # permet de deplacer le dossier spec dans mon dossier principale
    FileUtils.mv (".rspec"), ("#{name}") # pour que ça fonctionne il faut require 'fileutils'
end

def create_readme(name)
    file = File.open("#{name}/README.md", "a")
    file.puts("Je suis un dossier Ruby complet")
    file.close
end
  
def create_file_apprb(name)
    file = File.open("#{name}/app.rb", "a")
    file.puts("
require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/fichier_1'
require 'views/fichier_2'")
    file.close
end

def perform 
  folder_name = get_folder_name
  check_if_user_gave_input
  create_folder(folder_name)
  create_file_inside_views_folder(folder_name)
  puts "Le dossier #{folder_name} a bien été créé"
  create_gemfile(folder_name)
  move_gemfile(folder_name)
  create_file_env_and_gitignore(folder_name)
  git_init(folder_name)
  rspec_init(folder_name)
  create_readme(folder_name)
  create_file_apprb(folder_name)
end

perform



