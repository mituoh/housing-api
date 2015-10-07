require 'spec_helper'

describe Housing::API do
  let(:housing) { Housing::API.new(api_ip: 'http://192.168.129.40:1024') }

  it 'has a version number' do
    expect(Housing::Api::VERSION).not_to be nil
  end

  describe 'Air conditioner' do
    subject { housing.air_conditioner }
    it 'Set ON' do
      subject.on!
      expect(subject.status).to eq('ON')
    end
    it 'Set OFF' do
      subject.off!
      expect(subject.status).to eq('OFF')
    end
    it 'Set 27℃' do
      subject.set_temperature 27
      expect(subject.get_temperature).to eq('27')
    end
    it 'Get indoor temperature' do
      expect(subject.indoor_temperature).to eq('18')
    end
  end

  describe 'LED Light' do
    subject { housing.light }
    it 'Set ON' do
      subject.on!
      expect(subject.status).to eq('ON')
    end
    it 'Set OFF' do
      subject.off!
      expect(subject.status).to eq('OFF')
    end
  end
end
