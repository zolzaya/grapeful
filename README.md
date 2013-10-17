# Grapeful

Custom Response builder for Grape.

## Installation

Add this line to your application's Gemfile:

    gem 'grapeful'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grapeful

## Usage
Hello world example
```ruby
  class API < Grape::API
    get :hello do
      ful :hello, 'world'
    end
  end
```
The response will be
```ruby
  {
    "hello": "world"
  }
```

Using with ActiveRecord
```ruby
  class API < Grape::API
    resources :users do
      get '/' do
        users = User.recent
        ful :users, users
        ful :total, users.length if current_user.admin?
      end
    end
  end
```
The response will be
```ruby
  {
    "users": [
        {
            "id": 21,
            "name": "John Smith",
            "uic": "john",
            "role": "admin",
            "created_at": "2013-08-14T10:12:30.933Z"
        }
    ],
    "total": 1
  }
```

Using with `active_model_serializers`
```ruby
  class API < Grape::API
    resources :users do

      params { requires :user, type: Hash, desc: 'User data' }
      post '/' do
        user = User.new(params[:user])
        user.save!
        ful :user, UserSerializer.new(user), message: 'The user was successfuly created.'
      end
    end
  end
```
The response will be
```ruby
  {
    "user": {
            "id": 25,
            "name": "Don Dan",
            "uic": "don",
            "role": "admin",
            "created_at": "2013-08-14T10:12:30.933Z"
    },
    "message": "The user was successfully created."
  }
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
