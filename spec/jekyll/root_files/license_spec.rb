module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    context 'generate a LICENSE' do
      specify 'plain license' do
        Timecop.freeze Time.local 2016, 01, 19
        subject.options = { 'framework' => 'jekyll' }
        subject.generate 'dummy-app'
        expect('dummy_app/LICENSE.md').to have_content (
        """
        ##Copyright (c) 2016 YOUR-NAME-HERE

        #MIT License

        Permission is hereby granted, free of charge, to any person obtaining
        a copy of this software and associated documentation files (the
        'Software'), to deal in the Software without restriction, including
        without limitation the rights to use, copy, modify, merge, publish,
        distribute, sublicense, and/or sell copies of the Software, and to
        permit persons to whom the Software is furnished to do so, subject to
        the following conditions:

        The above copyright notice and this permission notice shall be
        included in all copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
        EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
        MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
        NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
        LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
        OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
        WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
        """
        )
        Timecop.return
      end

      specify 'with a provided name' do
        Timecop.freeze Time.local 2016, 01, 19
        subject.options = {licensor: 'Beyoncé'}
        subject.generate 'dummy-app'
        expect('dummy_app/LICENSE.md').to have_content (
        """
        ##Copyright (c) 2016 Beyoncé

        #MIT License

        Permission is hereby granted, free of charge, to any person obtaining
        a copy of this software and associated documentation files (the
        'Software'), to deal in the Software without restriction, including
        without limitation the rights to use, copy, modify, merge, publish,
        distribute, sublicense, and/or sell copies of the Software, and to
        permit persons to whom the Software is furnished to do so, subject to
        the following conditions:

        The above copyright notice and this permission notice shall be
        included in all copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
        EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
        MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
        NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
        LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
        OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
        WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
        """
        )
        Timecop.return
      end
    end
  end
end
