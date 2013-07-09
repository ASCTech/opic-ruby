# Opic

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'opic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install opic

## Usage


    # Getting an existing opic
    Opic.get 'decot.7', width: 200 # "https://opic.osu.edu/decot.7?width=200&aspect=s"

    # Uploading a new opic
    Opic.api_key = "xxxx"
    file = File.new(some_kind_of_path)
    Opic.post('decot.7', file) # true


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
