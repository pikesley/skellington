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

          {% include libs.html %}

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
          Generated with
          <a href='http://sam.pikesley.org/projects/skellington/' alt='Skellington' title='Skellington'>
            Skellington
          </a>
        </div>
        """
        )
      end

      it 'creates a nav' do
        subject.options = { 'framework' => 'jekyll' }
        subject.generate 'dummy-app'

        expect('dummy_app/_includes/nav.html').to have_content (
        """
        <ul class='nav nav-pills nav-fill p-3'>
          <li class='nav-item'>
            <a class='nav-link active' href='{{ site.baseurl }}/'>Home</a>
          </li>
          <li class='nav-item'>
            <a class='nav-link' href='{{ site.baseurl }}/foo/'>Foo</a>
          </li>
          <li class='nav-item'>
            <a class='nav-link' href='{{ site.baseurl }}/bar/'>Bar</a>
          </li>
        </ul>
        """
        )
      end

      it 'creates a JS libs section' do
        subject.options = { 'framework' => 'jekyll' }
        subject.generate 'dummy-app'

        expect('dummy_app/_includes/libs.html').to have_content (
        """
        {% for lib in site.data.libs.js %}
        <!-- {{ lib.name }} -->
        <script defer src='{{ lib.url }}'></script>
        {% endfor %}

        {% for lib in site.data.libs.css %}
        <!-- {{ lib.name }} -->
        <link rel='stylesheet' href='{{ lib.url }}'>
        {% endfor %}

        {% for font in site.data.libs.fonts %}
        <!-- {{ font.name }} -->
        <link rel='stylesheet' href='{{ font.url }}'>
        {% endfor %}
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
