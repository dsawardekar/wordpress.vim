import urllib
import urllib2
from HTMLParser import HTMLParser

class RequestBuilder:
    def build(self, data):
        request = urllib2.Request(self.form_url(), self.form_data(data), self.get_headers())
        return request

    def get_headers(self):
        headers                 = dict()
        headers['Content-Type'] = 'application/x-www-form-urlencoded'
        headers['Referer']      = self.referer_url()

        return headers

    def form_data(self, data):
        return urllib.urlencode(data)

    def form_url(self):
        return 'http://wordpress.org/plugins/about/validator/'

    def referer_url(self):
        return 'http://wordpress.org/plugins/about/validator/'

class ReadmeResponseParser(HTMLParser):
    def __init__(self):
        HTMLParser.__init__(self)

        self.errors          = []
        self.notes           = []
        self.success_message = ''
        self.state           = ''

    def class_list_for(self, tag, attrs):
        for attr in attrs:
            if attr[0] == 'class':
                return attr[1]

        return ''

    def handle_starttag(self, tag, attrs):
        class_list = self.class_list_for(tag, attrs)

        if tag == 'ul' and 'fatal error' in class_list:
            self.state = 'accept_error_list'
        elif tag == 'ul' and 'warning error' in class_list:
            self.state = 'accept_error_list'
        elif tag == 'ul' and 'note error' in class_list:
            self.state = 'accept_note_list'
        elif tag == 'div' and 'success' in class_list:
            self.state = 'accept_success'
        elif tag == 'li' and self.state == 'accept_error_list':
            self.state = 'accept_error_message'
        elif tag == 'li' and self.state == 'accept_note_list':
            self.state = 'accept_note_message'
        elif tag == 'code' and self.state == 'accept_error_message':
            self.state = 'append_error_message'
        elif tag == 'code' and self.state == 'accept_note_message':
            self.state = 'append_note_message'
        elif tag == 'p' and self.state == 'accept_success':
            self.state = 'accept_success_para'
        elif tag == 'code' and self.state == 'accept_success_para':
            self.state = 'append_success_message'
        else:
            self.state = ''

    def handle_endtag(self, tag):
        if tag == 'ul':
            self.state = ''
        elif tag == 'div':
            self.state = ''

    def handle_data(self, data):
        if self.state == 'accept_error_message':
            self.add_error(data)
        elif self.state == 'accept_note_message':
            self.add_note(data)
        elif self.state == 'accept_note_message':
            self.set_success_message(data)
        elif self.state == 'append_error_message':
            self.append_to_list(self.errors, data)
        elif self.state == 'append_note_message':
            self.append_to_list(self.notes, data)
        elif self.state == 'accept_success_para':
            self.append_success_message(data)
        elif self.state == 'append_success_message':
            self.append_success_message(data)
            self.state = 'accept_success_para'

    def append_to_list(self, list, message):
        n = len(list)
        list[n - 1] = list[n - 1] + self.strip_message(message)

    def strip_message(self, message):
        message = message.replace('\n', '')
        return message

    def add_error(self, message):
        message = self.strip_message(message)
        self.errors.append(message)

    def add_note(self, message):
        message = self.strip_message(message)
        self.notes.append(message)

    def set_success_message(self, message):
        message = self.strip_message(message)
        self.success_message = message

    def append_success_message(self, message):
        message = self.strip_message(message)
        self.success_message = self.success_message + message

    def get_errors(self):
        return self.errors

    def get_notes(self):
        return self.notes

    def has_errors(self):
        return len(self.errors) > 0

    def has_notes(self):
        return len(self.notes) > 0

    def did_succeed(self):
        return self.success_message != ''

    def get_success_message(self):
        return self.success_message

class ReadmeValidator:
    def load_file(self, path):
        with open(path, 'r') as file:
            return file.read()

    def remote_validate(self, data):
        builder = RequestBuilder()
        request = builder.build(data)
        return urllib2.urlopen(request).read()

    def request_data_for(self, path):
        data = dict()
        data['text'] = '1',
        data['readme_contents'] = self.load_file(path)

        return data

    def validate(self, path):
        data     = self.request_data_for(path)
        response = self.remote_validate(data)
        parser   = ReadmeResponseParser()
        parser.feed(response)

        if parser.has_errors():
            self.return_to_vim('errors', parser.get_errors())
        elif parser.has_notes():
            self.return_to_vim('notes', parser.get_notes())
        elif parser.did_succeed():
            self.return_to_vim('success', "'%s'" % parser.get_success_message())
        else:
            # TODO: Investigate HTMLParser
            self.return_to_vim('errors', 'Unknown response from wordpress.org')

    def return_to_vim(self, status, result):
        try:
            import vim
            vim.command('let readme_validation_status = "%s"' % status)
            vim.command('let readme_validation_result = %s' % result)
        except:
            print status
            print result


def test():
    validator = ReadmeValidator()
    validator.validate('tmp/readme_with_errors.txt')

test()

