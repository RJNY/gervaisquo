require 'spec_helper'
require_relative '../lib/gervais_quo'

describe GervaisQuo::Quote do
  subject(:quote) { GervaisQuo::Quote.new }

  it "is should be valid" do
    expect(quote).to be_a(GervaisQuo::Quote)
  end

  describe "#random_quote" do
    it "should return a quote" do
      response = subject.random_quote
      expect(response).to be_a(String)
    end
  end

  describe "#parse_file" do
    let(:response) {subject.send(:parse_file)}

    it "should be able to parse a file" do
      expect(response).to be_a(Array)
    end

    it "should have many quotes" do
      expect(response.length).not_to eq(0)
    end
  end

  describe "#call" do
    let(:proc) {Proc.new { |env| ['200', {'Content-Type' => 'text/plain'}, ['Important stuff right here!']] }}
    let(:middleware) {proc.call(subject)}

    it "should return valid response" do
      expect(subject.call({})).to be_an(Array)
    end

    it "should pass previous content" do
      expect(middleware[2]).to include('Important stuff right here!')
    end
  end



end
