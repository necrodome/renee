$LOAD_PATH << File.expand_path("../lib", __FILE__)
require 'renee_bindings'
{
  :name => "nathan",
  :books => {:title => 'bible'}
}

Person = Struct.new(:name, :books)
Book = Struct.new(:title)

#roughly analogous 

Renee::Bindings::DefaultFactory.binding(:book) do
  attr :title
  attr :year
end

Renee::Bindings::DefaultFactory.binding(:person) do 
  attr :name
  list :books, :book
end

#from to wrap them ..

#uniform attribute reader/writer

#nathan = Person.new(:name=>'nathan', :books => [Book.new("bible")])
#str = person_binding.from_ruby(nathan).to_json
#p str
#p person_binding.from_json(str).to(Person)
#p .bind_with(person_binding).to_json_s

data = {:name => 'nathan', :books => [{:title => 'bible', :year => 1999}, {:title => 'koran', :year => 2011}]}

input = Renee::Bindings::DefaultFactory.from_hash(data).bind_with(:person)
#puts input.to_json
puts "----"
puts input.to_ruby.inspect
puts input.to_json.inspect

# # JSON sematics:
# 
# 
# # factory
# 
# # class methods:
# 
# create_list
# create_object
# 
# # instance methods:
# 
# list?
# set_attr
# get_attr
# set_list_item
# get_list_item