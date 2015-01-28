# Pattern Man
A middleman extension that implements [Pattern Lab-style](http://patternlab.io) patterns.


[![Build Status](https://travis-ci.org/beardedstudio/middleman-patterns.svg?branch=develop)](https://travis-ci.org/beardedstudio/middleman-patterns)

[![Coverage Status](https://coveralls.io/repos/beardedstudio/middleman-patterns/badge.svg?branch=develop)](https://coveralls.io/r/beardedstudio/middleman-patterns?branch=develop)

### Installation

You'll need to install this gem first.

* put `gem 'middleman-patterns'` in the Gemfile of your middleman project
* run `bundle install`
* add `activate :patterns` to your `config.rb` file outside the `configure :build` block


You're up and running! This gem supports whatever templating engines middleman supports, but you do need to put the template files for patterns where this extension can find them. The expected default directory structure looks like the following (filenames are examples):

```
source/
  patterns/
    templates/
      user-information.html.erb
    organisms/
      address-input.html.erb
    molecules/
      labeled-input.html.erb
    atoms/
      button.html.erb
```

### Using Patterns

Put some HTML in your patterns:

```html+ruby
# patterns/molecules/labeled-input.html.erb
---
input_class: 'input'
---

<div class="<%=input_class%>">
  <label for="<%=input_id%>">
    <%= label_text %>
  </label>
  <%= atom 'input' %>
</div>
```

```html+ruby
# patterns/atoms/input.html.erb
---
input_type: text
---
<input type="<%= input_type %>" <% if input_id %> id="<%= input_id %>" <% end %>>
```

Then use the appropriate helper method in your middleman view:

```html+ruby
# source/index.html.erb

<div class="welcome">
  <%= molecule 'labeled-input', input_id: 'some_input', label_text: "Fill me out!" %>
</div>
```

And your output will be:

```html
<div class="welcome">
  <div class="input">
    <label for="some_input">
      Fill me out!
    </label>
    <input type="text"  id="some_input">
  </div>
</div>
```

### Demo Site
We put a little [demo](http://beardedstudio.github.io/middleman-patterns/) up online!

### Config options

You can customize the patterns directory by passing `patterns_directory: 'other_directory'` when activating the extension.

By default, this extension ignores everything in the `patterns` directory when building the site, so you don't end up with pages with URLs like `/patterns/atoms/button.html`. You can override this so that the site *does* build these pages if you want, by passing the `build_patterns` option.

`activate :patterns, build_patterns: true`
