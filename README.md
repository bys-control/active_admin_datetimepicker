[![Build Status](https://img.shields.io/travis/activeadmin-plugins/active_admin_datetimepicker.svg)](https://travis-ci.org/activeadmin-plugins/active_admin_datetimepicker)

# ActiveAdminDatetimepicker

Adds ability to use XDSoft's DateTime picker as the date_time_picker input for forms, and date_time_range for filters


![ActiveAdminDatetimepicker](https://raw.githubusercontent.com/ActiveAdminPlugins/activeadmin_datetimepicker/master/screen/screen.png "ActiveAdminDatetimepicker")

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_admin_datetimepicker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_admin_datetimepicker

## Usage

Plugin  offers the `date_time_picker` input and `date_time_range` filter , which use the [XDSoft DateTime Picker gem](https://github.com/shekibobo/xdan-datetimepicker-rails).
The `date_time_picker` input accepts many of the options available to the standard jQueryUI Datepicker. For example:

 JS asset
 ```//= require active_admin_datetimepicker```

 CSS
 ```@import "active_admin_datetimepicker";```


```ruby
form do |f|
  f.input :starts_at, as: :date_time_picker, datepicker_options: { min_date: "2013-10-8",        max_date: "+3D" }
  f.input :ends_at,   as: :date_time_picker, datepicker_options: { min_date: 3.days.ago.to_date, max_date: "+1W +5D" }
end
```

```ruby
    filter :created_at, as: :date_time_range
```


## Override behaviour in initializer
```ruby
# This if for front-end javascript side
ActiveAdminDatetimepicker::Base.default_datetime_picker_options = {
    defaultDate: proc { Time.current.strftime("%Y-%m-%d 00:00") }
}
# This if for backend(Ruby)
ActiveAdminDatetimepicker::Base.format = "%Y-%m-%d %H:%M:%S"
```

## Change datetime format
If you want to change format - you need to make sure that front-end and back-end formats are identical. And remember JS and Ruby datetime format has different syntax.

Create configuration file '/config/initializers/init_datetimpicker.rb'

```ruby
# Example "11/03/2016 13:00"
ActiveAdminDatetimepicker::Base.default_datetime_picker_options = {
    format: 'd/m/Y H:i', # JS format
    defaultTime: proc { Time.current.strftime('%H:00') } # not necessary
}
ActiveAdminDatetimepicker::Base.format = "%d/%m/%Y %H:%M" # Ruby format
```

See [the datetimepicker documentation for more details](http://xdsoft.net/jqplugins/datetimepicker/).


## Contributing

1. Fork it ( https://github.com/activeadmin-plugins/activeadmin_datetimepicker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
