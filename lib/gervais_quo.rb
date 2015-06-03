require_relative "gervais_quo/version"

module GervaisQuo
  class Quote
    attr_reader :random_quote

    def initialize app=nil
      @app = app
      @quotes = parse_file
    end

    def call env
      request = env["REQUEST_PATH"]
      if request == '/quote' || request == '/quote/'
        if @app.nil?
          ['200', {'Content-Type' => 'text/plain'}, [self.random_quote]]
        else
          status, headers, response = @app.call(env)
          response.unshift("#{self.random_quote}\n")
          [status,headers,response]
        end
      else
        if @app.nil?
          ['200', {'Content-Type' => 'text/plain'}, ['']]
        else
          status, headers, response = @app.call(env)
          [status,headers,response]
        end
      end
    end

    def random_quote
      index = rand(@quotes.length)
      @quotes[index]
    end

    private

    def parse_file
      data = []
      path = File.join(File.dirname(__FILE__))
      File.open(path + '/fixtures/rickygervais.txt', 'r').each_line do |line|
        data << line.chomp
      end
      data
    end

  end
end
