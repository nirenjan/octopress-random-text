#
# Author: Nirenjan Krishnan
#
# Example usage: {% randomtext %}
#

module Jekyll
  class RandomText < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      @filename = nil
      @id = 'random-text-' + ('0'..'9').to_a.sample(8).join('')
      
      # Get an optional filename or use /random-texts.txt
      if markup =~ /\s*file:(\S+)\s*/i
        @filename = $1
      else
        @filename = '/random-texts.txt'
      end
    end

    def render(context)
      rendered = <<-RANDJS
        <p id="#{@id}"></p>
        <script type="text/javascript">
          var request = new XMLHttpRequest();
          request.onload = function() {
            // get the file contents
            var fileContent = this.responseText;
            // split into lines
            var fileContentLines = fileContent.split( '\\n' );
            // get a random index (line number)
            var randomLineIndex = Math.floor( Math.random() * fileContentLines.length );
            // extract the value
            var randomLine = fileContentLines[ randomLineIndex ];

            // add the random line in a div
            document.getElementById( '#{@id}' ).innerHTML = randomLine;
          };
          request.open( 'GET', '#{@filename}', true );
          request.send();
        </script>
      RANDJS
      rendered
    end
  end
end

Liquid::Template.register_tag('randomtext', Jekyll::RandomText)
