module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a default layout' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy_app'
      expect('dummy_app/_layouts/default.html').to have_content (
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
          <script src='/javascripts/bootstrap.min.js'></script>

          <link rel='stylesheet' href='/assets/application.css' type='text/css' />
          <title>{{ page.title }}</title>
        </head>

        <body>
          <div class='container'>
            {{ content }}
          </div>
        </body>
      </html>
      """
      )
    end
  end
end
