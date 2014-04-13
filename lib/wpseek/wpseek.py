import urllib
import json
import pprint

class WpSeekApi:
    def find_similar(self, keyword, limit):
        finder = SimilarFinder()
        result = finder.find(keyword, limit)

        self.return_to_vim(result)

    def find_topics(self, keyword, limit):
        finder = TopicFinder()
        result = finder.find(keyword, limit)

        self.return_to_vim(result)

    def return_to_vim(self, results):
        try:
            import vim
            vim.command('let api_result = %s' % results)
        except:
            print results


class TopicFinder:
    def find(self, keyword, limit):
        url = self.build_url_for(keyword, limit)
        response = urllib.urlopen(url).read()
        response = response[1:-2]
        return response.replace("\n", " ")

    def build_url_for(self, keyword, limit):
        builder = WpSeekUrlBuilder()
        return builder.build('gettopics', keyword, { 'limit': limit })

class SimilarFinder:
    def find(self, keyword, limit):
        url      = self.build_url_for(keyword, limit)
        response = urllib.urlopen(url).read()
        response = response[1:-2]
        return response.replace("\n", " ")

    def build_url_for(self, keyword, limit):
        builder = WpSeekUrlBuilder()
        return builder.build('getsimilar', keyword, { 'limit': limit })

class WpSeekUrlBuilder:
    def build(self, method, query, opts = {}):
        opts['method'] = 'wordpress.%s' % method
        opts['s'] = query
        args = urllib.urlencode(opts)

        return "http://api.wpseek.com/?%s" % args
