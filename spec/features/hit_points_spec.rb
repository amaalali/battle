require 'spec_helper'

feature 'View hit points' do

before do
  
end

 scenario 'see Player 2 hit points' do
  visit('/')
  sign_in_and_play
  expect(page).to have_content 'Mittens: 60hp'
 end

 scenario 'see Player 1 hit points' do
   visit('/')
   sign_in_and_play
   expect(page).to have_content 'Dave: 60hp'
 end

end
