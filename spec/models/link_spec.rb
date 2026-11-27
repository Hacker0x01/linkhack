require 'helper'

describe Link do
  describe 'URL validation' do
    subject { described_class.new url: link, shortlink: 'g' }

    before { subject.validate }

    describe 'http links' do
      let(:link) { 'http://www.google.com' }

      it { is_expected.to be_valid }
    end

    describe 'https links' do
      let(:link) { 'https://www.google.com' }

      it { is_expected.to be_valid }
    end

    describe 'javascript links' do
      let(:link) { 'javascript:alert(/x/)' }

      it { is_expected.to be_invalid }
      it { expect(subject.errors[:url]).to eq ['is not a valid URL'] }
    end

    describe 'javascript with http links' do
      let(:link) { 'javascript:alert(\'Hello world http://\')' }

      it { is_expected.to be_invalid }
      it { expect(subject.errors[:url]).to eq ['is not a valid URL'] }
    end
  end

  describe '.levenshtein_distances' do
    let!(:link) { described_class.create! shortlink: 'zz-levenshtein', url: 'https://example.com' }

    after { link.destroy }

    it 'returns each link with its edit distance to the query' do
      match = described_class.levenshtein_distances('zz-levenshtain').find { |result| result.link == link }

      expect(match.distance).to eq 1
    end
  end
end
