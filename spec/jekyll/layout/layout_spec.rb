module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    context 'layout' do
      it 'creates a header' do
        subject.options = { 'framework' => 'jekyll' }
        subject.generate 'dummy-app'

        expect('dummy_app/_includes/header.html').to have_content (
        """
        <head>
          <meta charset='utf-8' />
          <meta http-equiv='X-UA-Compatible' content='IE=edge' />
          <meta name='viewport' content='width=device-width, initial-scale=1' />

          {% include ie-cruft.html %}

          {% for lib in site.data.libs.js %}
          <!-- {{ lib.name }} -->
          <script src='{{ lib.url }}'></script>
          {% endfor %}

          {% for lib in site.data.libs.css %}
          <!-- {{ lib.name }} -->
          <link rel='stylesheet' href='{{ lib.url }}'>
          {% endfor %}

          {% for font in site.data.libs.fonts %}
          <!-- {{ font.name }} -->
          <link rel='stylesheet' href='{{ font.url }}'>
          {% endfor %}

          <link rel='icon' type='image/png' href='{{ site.baseurl }}/assets/favicon.ico' />
          <link rel='stylesheet' href='{{ site.baseurl }}/css/styles.css' />
          <script src='{{ site.baseurl }}/js/dummy_app.js'></script>
          <title>
          {{ page.title }}
          </title>
        </head>
        """
        )
      end

      it 'creates a footer' do
        subject.options = { 'framework' => 'jekyll' }
        subject.generate 'dummy-app'

        expect('dummy_app/_includes/footer.html').to have_content (
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
      end

      it 'creates a nav' do
        subject.options = { 'framework' => 'jekyll' }
        subject.generate 'dummy-app'

        expect('dummy_app/_includes/nav.html').to have_content (
        """
        <nav class='navbar navbar-default navbar-static-top'>
          <div class='container-fluid'>
            <div class='navbar-header'>
              <button type='button'
                      class='navbar-toggle collapsed'
                      data-toggle='collapse'
                      data-target='#navbar'
                      aria-expanded='false'
                      aria-controls='navbar'>
                <span class='sr-only'>Toggle navigation</span>
                <span class='icon-bar'></span>
                <span class='icon-bar'></span>
                <span class='icon-bar'></span>
              </button>
              <a class='navbar-brand' href='/'>Home</a>
            </div>
            <div id='navbar' class='navbar-collapse collapse'>
              <ul class='nav navbar-nav'>
                <li><a href='/foo'>Foo</a></li>
                <li><a href='/bar'>Bar</a></li>
              </ul>
            </div>
          </div>
        </nav>
        """
        )
      end

      it 'creates a layout' do
        subject.options = { 'framework' => 'jekyll' }
        subject.generate 'dummy-app'

        expect('dummy_app/_layouts/default.html').to have_content (
        """
        <!DOCTYPE html>
        <html lang='en'>
          {% include header.html %}
          <body>
            {% include nav.html %}
            <div class='container'>
              {{ content }}
            </div>
            {% include footer.html %}
          </body>
        </html>
        """
        )
      end

      it 'has the ie shims' do
        subject.options = { 'framework' => 'jekyll' }
        subject.generate 'dummy-app'

        expect('dummy_app/_includes/ie-cruft.html').to have_content (
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
