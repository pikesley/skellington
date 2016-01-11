module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'app file' do
      subject.generate 'dummy_app'
      expect('dummy_app/lib/views/default.erb').to contain (
      """
      <!DOCTYPE html>
      <html lang='en'>
        <head>
          <meta charset='utf-8' />
          <meta http-equiv='X-UA-Compatible' content='IE=edge' />
          <meta name='viewport' content='width=device-width, initial-scale=1' />

          <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
          <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
          <!--[if lt IE 9]>
            <script src='https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></script>
            <script src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></script>
          <![endif]-->

          <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
          <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
          <!-- Include all compiled plugins (below), or include individual files as needed -->
          <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
          <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css' type='text/css' />
          <link rel='icon' type='image/png' href='/assets/favicon.ico' />
          <title><%= @title %></title>
        </head>

        <body>
          <div class='container'>
            <div class='row'>
              <div class='col-md-2'></div>
              <div class='col-md-8'>
                <%= yield %>
              </div>
              <div class='col-md-2'></div>
            </div>
          </div>
        </body>
      </html>
      """
      )
      expect('dummy_app/lib/views/index.erb').to contain (
      """
      <%= @content %>
      """
      )
    end
  end
end
