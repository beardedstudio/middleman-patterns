# encoding: utf-8
module Middleman
  module Patterns
    # These helpers are available in source template files.
    #
    # Helpers are defined dynamically to match the pattern types in the
    # PATTERNS constant.
    #
    # These pattern calls all work identically except for the path the extension
    # checks for the source file (based on pattern type).
    #
    # Variables are available in patterns and can come from one of three places:
    #
    # * Front matter in the pattern file itself
    # * locals passed to the pattern
    # * locals that were passed into the currently-rendering pattern
    #
    # @example Nested Patterns
    #
    # Given the following two patterns for a button:
    #
    #    # patterns/molecules/buttons.html.erb
    #    ---
    #    div_class: 'button'
    #    ---
    #    <div class="<%= div_class %>">
    #      <%= atom 'button', button_text: 'molecule button' %>
    #    </div>
    #
    #    --------------------------
    #
    #    # patterns/atoms/button.html.erb
    #    ---
    #    button_text: I'm a button
    #    ---
    #
    #    <button type="button"><%= button_text %></button>
    #
    #
    # Variable precendence flows from highest->lowest pattern in terms of nesting,
    # so a molecule with a local passed which is the same name as application data
    # variable or front-matter variable will be overridden (div_class above).
    #
    #    # index.html.erb
    #    <%= molecule 'buttons', div_class: 'big-button' %>
    #    <%= molecule 'buttons', button_text: "Send 1000 emails" %>
    #
    # Should render:
    #
    #    <div class="big-button">
    #      <button type="button">molecule button</button>
    #    </div>
    #
    #    <div class="button">
    #      <button type="button">Send 1000 emails</button>
    #    </div>
    #
    # @see PATTERNS
    module Helpers
      PATTERNS = %w(template organism molecule atom)

      # Getter for locals passed into pattern calls.
      # Allows scoping for variables for nested pattern rendering
      #
      # Example: Rendering a molecule template that renders a "Label" atom:
      #
      # Calling as `molecule 'labeled-input', label_class: 'optional'`
      # will override the atom's label_class local, even though in the molecule's template
      # the label atom will be called without explicitly setting the label_class.
      #
      # @return [Hash]
      def context_variables
        @context_variables ||= {}
        @context_variables
      end

      PATTERNS.each do |type|
        # define helper methods available to templates. They all have the same signature.
        define_method type do |name, locals = {}, context = self|
          path = resolve_pattern_path(type, name)

          # keep a copy of our old state
          old_context = context_variables.dup

          # update our state
          update_context locals, extensions[:frontmatter].data(path).first

          # render the file (including potentially recursively other patterns)
          output = render_individual_file(path, context_variables, {}, context)

          # restore our state pre-call
          @context_variables = old_context

          output
        end
      end

      # Get the path to the specified pattern on disk. This respects the config setting
      # patterns_directory to determine where to look.
      #
      # @see {PatternsExtension#patterns_directory}
      # @param [String] pattern_type The type of pattern
      # @param [String] pattern_name The name of the pattern (without file extension)
      # @return [String] The absolute path to the specified pattern on disk.
      def resolve_pattern_path(pattern_type, pattern_name)
        path = File.join(config.patterns_directory, pattern_type.pluralize, pattern_name)
        absolute_path = resolve_template(path)

        unless absolute_path
          error_message = "#{pattern_type.capitalize} #{pattern_name} not found: #{path}"
          raise ::Middleman::CoreExtensions::Rendering::TemplateNotFound, error_message
        end

        absolute_path
      end

      private

      # Update the contextual variables from the parent pattern
      #
      # This handles setting priority between frontmatter data,
      # locals passed when rendering, and locals passed from the parent pattern.
      # @param locals [Hash] A set of locals
      # @return [Mixed]
      def update_context(locals = {}, frontmatter = {})
        # This is our currently-passed context
        old_context = context_variables.dup

        # Override front-matter data with locals
        new_context = frontmatter.merge(locals)

        # Override the result with anything passed from a higher level
        @context_variables = new_context.merge(old_context)
      end
    end
  end
end
