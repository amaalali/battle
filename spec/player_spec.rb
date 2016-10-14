require 'player'

describe Player do

subject(:dave)    {described_class.new('Dave')   }
subject(:mittens) {described_class.new('Mittens')}

describe '#name' do
  it 'returns its name' do
    expect(dave.name).to eq 'Dave'
   end
  end

  describe '#hit_points' do
   it 'starts with default hit points' do
    expect(dave.hit_points).to eq described_class::DEFAULT_HIT_POINTS
   end
  end

  describe '#receive_damage' do
    it 'deals damage to player' do
      allow(Kernel).to receive(:rand).and_return(10)
      expect { dave.receive_damage }.to change { dave.hit_points }.by(-10)
    end
  end

end
