# README
CREATE AN API:
Create rails api: rails new NAME --api
  rails g model owner name age:integer 
  generate model, then give attributes of name and age
  When type model, generates model AND migration - when you generate migration, just get a migration rather than both

Rails db:migrate

Create dog table: rails g model dog name age:integer owner:references
  Should be singular (dog, not dogs)

rails db:migrate
 Create routes.rb for index action:	resources: :dogs, only: [:index]

rails routes to see what routes you have created

Create controller and index action:
  rails g controller dogs
  In DogsController:
   def index
          @dogs = Dog.all
          render json: @dogs
   end

Put things into seeds.rb: 
  Owner.destroy_all
  bob = Owner.create(name: "Bob", age: 33)
  mike = Owner.create(name: "Mike", age: 9)
 
  rover = Dog.create(name: "Rover", age: 2, owner: bob)
  fido = Dog.create(name: "Fido", age: 3, owner: bob)
 
  bob.dog.create(name: "Barky", age: 5)
 
  mike.dog.create(name: "Dog", age: 9)
Dogs dependent on owners so need to destroy the thing that is dependent first

Add relationship to model: create has_many relationship: has_many :dogs, dependent: :destroy
  rails db:seed
  rails s then test on Postman
   Add :show to routes
  Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :dogs, only: [:index, :show]
  end

Add show method to dogs controller
    def show 
          @dog = Dog.find(params[:id])

          render json: @dog
    end

Add POST (create) method to dogs controller
    def create
        name = params[:name]
        age = params[:age]
        owner_id = params[:owner_id]
        Dog.create(name: name, age: age, owner_id: owner_id)
        render json: dog
    end


