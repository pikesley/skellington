module Skellington
  describe CLI do
    context 'sinatra' do
      let :subject do
        described_class.new
      end

      it 'includes some third-party javascript libs' do
        subject.generate 'dummy-app'

        expect('dummy_app/views/includes/js-libs.erb').to have_content (
        """
        <%
        libs = {
          jquery: {
            url:  '//code.jquery.com/jquery-3.3.1.min.js',
            hash: 'sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8='
          },
          popper: {
            url:  '//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js',
            hash: 'sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q'
          },
          bootstrap: {
            url:  '//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js',
            hash: 'sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl'
          },
          fontawesome: {
            url:  '//use.fontawesome.com/releases/v5.0.4/js/all.js',
            hash: ''
          }
        }

        libs.each do |lib| %>
          <!-- <%= lib[0] %> -->
          <script src='<%= lib[1][:url] %>' integrity='<%= lib[1][:hash] %>' crossorigin='anonymous'></script>
        <% end %>
        """
        )
      end

      it 'includes some third-party css' do
        subject.generate 'dummy-app'

        expect('dummy_app/views/includes/css-libs.erb').to have_content (
        """
        <%
        libs = {
        }.each_pair do |name, url| %>
          <!-- <%= name %> -->
          <link rel='stylesheet' href='<%= url %>'>
        <% end %>
        """
        )
      end

      it 'includes some fonts' do
        subject.generate 'dummy-app'

        expect('dummy_app/views/includes/fonts.erb').to have_content (
        """
        <%
        libs = {
          ubuntu: '//fonts.googleapis.com/css?family=Ubuntu+Mono'
        }.each_pair do |name, url| %>
          <!-- <%= name %> -->
          <link rel='stylesheet' href='<%= url %>'>
        <% end %>
        """
        )
      end

      it 'handles some cruft required by IE' do
        subject.generate 'dummy-app'

        expect('dummy_app/views/includes/ie-cruft.erb').to have_content (
        """
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src='//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></script>
          <script src='//oss.maxcdn.com/respond/1.4.2/respond.min.js'></script>
        <![endif]-->
        """
        )
      end
    end
  end
end
