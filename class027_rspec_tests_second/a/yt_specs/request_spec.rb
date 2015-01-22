require 'spec_helper'
require 'yt/request'


describe Yt::Request do
  subject(:request) { Yt::Request.new host: 'example.com' }
  let(:response) { response_class.new nil, nil, nil }
  let(:response_body) { }

  describe '#run' do
    context 'given a request that returns' do
      before { allow(response).to receive(:body).and_return response_body }
      before { expect(Net::HTTP).to receive(:start).once.and_return response }

      context 'a success code 2XX' do
        let(:response_class) { Net::HTTPOK }

        it { expect{request.run}.not_to fail }
      end

      context 'an error code 5XX' do
        let(:response_class) { Net::HTTPServerError }
        let(:retry_response) { retry_response_class.new nil, nil, nil }
        before { allow(retry_response).to receive(:body) }
        before { expect(Net::HTTP).to receive(:start).at_least(:once).and_return retry_response }

        context 'every time' do
          let(:retry_response_class) { Net::HTTPServerError }

          it { expect{request.run}.to fail }
        end

        context 'but returns a success code 2XX the second time' do
          let(:retry_response_class) { Net::HTTPOK }

          it { expect{request.run}.not_to fail }
        end
      end

      context 'an error code 401' do
        let(:response_class) { Net::HTTPUnauthorized }

        it { expect{request.run}.to fail }
      end

      context 'any other non-2XX error code' do
        let(:response_class) { Net::HTTPNotFound }

        it { expect{request.run}.to fail }
      end
    end

    # TODO: clean up the following tests, removing repetitions
    context 'given a request that raises' do
      before { expect(Net::HTTP).to receive(:start).once.and_raise http_error }

      # NOTE: This test is just a reflection of YouTube irrational behavior of
      # being unavailable once in a while, and therefore causing Net::HTTP to
      # fail, although retrying after some seconds works.
      context 'an OpenSSL::SSL::SSLError' do
        let(:http_error) { OpenSSL::SSL::SSLError.new }

        context 'every time' do
          before { expect(Net::HTTP).to receive(:start).at_least(:once).and_raise http_error }

          it { expect{request.run}.to fail }
        end

        context 'but works the second time' do
          before { expect(Net::HTTP).to receive(:start).at_least(:once).and_return retry_response }
          before { allow(retry_response).to receive(:body) }
          let(:retry_response) { Net::HTTPOK.new nil, nil, nil }

          it { expect{request.run}.not_to fail }
        end
      end

      # NOTE: This test is just a reflection of YouTube irrational behavior of
      # being unavailable once in a while, and therefore causing Net::HTTP to
      # fail, although retrying after some seconds works.
      context 'an Errno::ETIMEDOUT' do
        let(:http_error) { Errno::ETIMEDOUT.new }

        context 'every time' do
          before { expect(Net::HTTP).to receive(:start).at_least(:once).and_raise http_error }

          it { expect{request.run}.to fail }
        end

        context 'but works the second time' do
          before { expect(Net::HTTP).to receive(:start).at_least(:once).and_return retry_response }
          before { allow(retry_response).to receive(:body) }
          let(:retry_response) { Net::HTTPOK.new nil, nil, nil }

          it { expect{request.run}.not_to fail }
        end
      end

      # NOTE: This test is just a reflection of YouTube irrational behavior of
      # being unavailable once in a while, and therefore causing Net::HTTP to
      # fail, although retrying after some seconds works.
      context 'an Errno::ENETUNREACH' do
        let(:http_error) { Errno::ENETUNREACH.new }

        context 'every time' do
          before { expect(Net::HTTP).to receive(:start).at_least(:once).and_raise http_error }

          it { expect{request.run}.to fail }
        end

        context 'but works the second time' do
          before { expect(Net::HTTP).to receive(:start).at_least(:once).and_return retry_response }
          before { allow(retry_response).to receive(:body) }
          let(:retry_response) { Net::HTTPOK.new nil, nil, nil }

          it { expect{request.run}.not_to fail }
        end
      end

      # NOTE: This test is just a reflection of YouTube irrational behavior of
      # being unavailable once in a while, and therefore causing Net::HTTP to
      # fail, although retrying after some seconds works.
      context 'an OpenSSL::SSL::SSLErrorWaitReadable' do
        let(:http_error) { OpenSSL::SSL::SSLErrorWaitReadable.new }

        context 'every time' do
          before { expect(Net::HTTP).to receive(:start).at_least(:once).and_raise http_error }

          it { expect{request.run}.to fail }
        end

        context 'but works the second time' do
          before { expect(Net::HTTP).to receive(:start).at_least(:once).and_return retry_response }
          before { allow(retry_response).to receive(:body) }
          let(:retry_response) { Net::HTTPOK.new nil, nil, nil }

          it { expect{request.run}.not_to fail }
        end
      end
    end
  end
end