module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'includes some third-party javascript libs' do
      subject.generate 'dummy-app'

      expect('dummy_app/views/includes/js-libs.erb').to have_content (
      """
      <%
      libs = {
        jquery: '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js',
        bootstrap: '//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'
      }.each_pair do |name, url| %>
        <!-- <%= name %> -->
        <script src='<%= url %>'></script>
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

      expect('dummy_app/views/includes/fonts-libs.erb').to have_content (
      """
      <%
      libs = {
        fontawesome: '//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css',
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
