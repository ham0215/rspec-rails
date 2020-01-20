Feature: Generator spec

    RSpec spec are normally generated alongside other application components.
    For instance, `rails generate model` will also generate an RSpec spec file
    for the model but you can also use your own generator. See
    [customizing your workflow](https://guides.rubyonrails.org/generators.html#customizing-your-workflow)

    @remove-generator-files
    Scenario: Use custom generator without '--generator-specs' arg
        When I run `bundle exec rails generate generator my_generator`
        Then the features should pass
        Then the output should contain:
          """
                create  lib/generators/my_generator
                create  lib/generators/my_generator/my_generator_generator.rb
                create  lib/generators/my_generator/USAGE
                create  lib/generators/my_generator/templates
                invoke  rspec
          """

    @remove-generator-files
    Scenario: Use custom generator with '--generator-specs' arg
        When I run `bundle exec rails generate generator my_generator --generator-specs`
        Then the features should pass
        Then the output should contain:
          """
                create  lib/generators/my_generator
                create  lib/generators/my_generator/my_generator_generator.rb
                create  lib/generators/my_generator/USAGE
                create  lib/generators/my_generator/templates
                invoke  rspec
                create    spec/generator/my_generators_generator_spec.rb
          """