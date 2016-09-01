module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates some includes' do
      subject.generate 'dummy_app'

      expect('dummy_app/views/includes/header.erb').to have_content (
      """
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
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
        <link rel='icon' type='image/png' href='/assets/favicon.ico' />
        <link rel='stylesheet' href='/css/styles.css' />
        <script src='/js/dummy_app.js'></script>
        <title><%= @title %></title>
      </head>
      """
      )
      expect('dummy_app/views/index.erb').to have_content (
      """
      <%= @content %>
      """
      )

      expect('dummy_app/views/includes/footer.erb').to have_content (
      """
      <div class='footer'>
        <div class='row'>
          <div class='col-md-12 text-center bottom'>
            Generated with
            <a href='http://sam.pikesley.org/projects/skellington/' alt='Skellington' title='Skellington'>
              Skellington
            </a>
          </div>
        </div>
      </div>
      """
      )

      expect('dummy_app/views/includes/github-corner.erb').to have_content (
      """
      <?xml version='1.0' standalone='no'?>
      <?xml-stylesheet type='text/css' href='styles.css'?>
      <a href='<%= @github_url %>' class='github-corner' aria-label='Fork me on Github'>
        <svg xmlns='http://www.w3.org/2000/svg' width='80' height='80' viewBox='0 0 250 250' fill='#151513' style='position: absolute; top: 0; right: 0'>
          <path class='octo-background' d='M0 0l115 115h15l12 27 108 108V0z' fill='#fff'/>
          <path class='octo-arm' d='M128 109c-15-9-9-19-9-19 3-7 2-11 2-11-1-7 3-2 3-2 4 5 2 11 2 11-3 10 5 15 9 16' style='-webkit-transform-origin: 130px 106px; transform-origin: 130px 106px'/>
          <path class='octo-body' d='M115 115s4 2 5 0l14-14c3-2 6-3 8-3-8-11-15-24 2-41 5-5 10-7 16-7 1-2 3-7 12-11 0 0 5 3 7 16 4 2 8 5 12 9s7 8 9 12c14 3 17 7 17 7-4 8-9 11-11 11 0 6-2 11-7 16-16 16-30 10-41 2 0 3-1 7-5 11l-12 11c-1 1 1 5 1 5z'/>
        </svg>
      </a>
      """
      )
    end
  end
end
