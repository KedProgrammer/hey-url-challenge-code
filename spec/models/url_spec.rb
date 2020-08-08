# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:original_url) }

    context 'valid original and short_url' do
      it 'no Uppercase letters' do
        url = Url.new(original_url: 'http://www.google.com', short_url: '456a6')
        expect(url).to be_valid
      end

      it 'upper case letters' do
        url = Url.new(original_url: 'http://www.google.com', short_url: '456SA')
        expect(url).to be_valid
      end
    end

    context 'invalid url' do
      it 'has invalid original_url' do
        ['google', 'goog le.com', 'goog@#le.com', 'goog.c', 'http://google.com', 'http://google.c'].each do |invalid_url|
          url = Url.new(original_url: invalid_url, short_url: '456a6')
          expect(url).to be_invalid
        end
      end

      it 'has valid short_url' do
        # url = Url.create(original_url: 'googla.com', short_url: '456 a6')
        # url2 = Url.new(original_url: 'google.com', short_url: '456a6d')
        %w[AS5dr 56sds]. each do |tester|
          expect(Url::REGEX.match?(tester)).to eql(true)
        end
      end

      it 'has invalid short_url' do
        # url = Url.create(original_url: 'googla.com', short_url: '456 a6')
        # url2 = Url.new(original_url: 'google.com', short_url: '456a6d')
        ['AS5 dr', '56@ds', '5*$32', 'SDS43d', '#6743']. each do |tester|
          expect(Url::REGEX.match?(tester)).to eql(false)
        end
      end
    end
  end
end
