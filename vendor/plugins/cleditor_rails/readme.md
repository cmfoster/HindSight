# jQuery CLEditor plugin
Rails 3.1 Asset Plugin  

## Install

Add to your Gemfile

```ruby
gem 'jquery-rails'
gem 'cleditor_rails'
```

bundle install

Edit app/assets/javascripts/application.js and add

```javascript
//= require jquery
//= require cleditor
```

And in app/assets/stylesheets/application.css add

```css
/*
*= require_self
*= require cleditor
*/
```

## Usage

```javascript

// specify editor controls if you like
$.cleditor.defaultOptions.controls = "style bold italic underline strikethrough image link undo redo";

$('textarea').cleditor();
```

Please see <http://premiumsoftware.net/cleditor/docs/GettingStarted.html> guide for customization

## Credits

The jQuery code was written by Chris Landowski

Project links:
<https://github.com/cleditor/cleditor>  
<http://premiumsoftware.net/cleditor/>
