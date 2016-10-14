require 'spec_helper'

feature 'Attack' do

  before do
    allow(Kernel).to receive(:rand).and_return(10)
  end

  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Dave attacked Mittens'
  end

  scenario 'reduce player 2 hit points by 10' do
    sign_in_and_play
    attack_and_confirm
    expect(page).not_to have_content 'Mittens: 60hp'
    expect(page).to have_content 'Mittens: 50hp'
  end
end
