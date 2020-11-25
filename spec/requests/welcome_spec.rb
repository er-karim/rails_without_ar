require 'rails_helper'

RSpec.describe 'Welcome API', type: :request do
  # Test suite for GET /hello
  describe 'GET /hello' do
    context 'when the name param exists' do
      # make HTTP get request before each example
      before { get '/hello.json?name=John' }

      it 'returns hello with the name' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json).to eq({ 'hello' => 'John'})
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the name param does not exists' do
      # make HTTP get request before each example
      before { get '/hello.json' }

      it 'returns an error' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json).to eq({ 'status' => 'error', 'code' => 422, 'message' => 'No name param given' })
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  # Test suite for GET /reverse
  describe 'GET /reverse' do
    context 'when the string param exists' do
      # make HTTP get request before each example
      before { get '/reverse.json?string=Hello%20from%20my%20API!' }

      it 'returns reverse with the reversed string' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json).to eq({ 'reversed_string' => '!IPA ym morf olleH'})
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the string param does not exists' do
      # make HTTP get request before each example
      before { get '/reverse.json' }

      it 'returns an error' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json).to eq({ 'status' => 'error', 'code' => 422, 'message' => 'No string param given' })
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
