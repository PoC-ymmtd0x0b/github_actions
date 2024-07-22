# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  scenario 'ユーザーを一覧表示する' do
    FactoryBot.create(:user, name: 'taro')
    FactoryBot.create(:user, name: 'hanako')

    visit users_path
    expect(page).to have_element('h1', text: 'Users')
    expect(page).to have_content 'taro'
    expect(page).to have_content 'hanako'
  end

  scenario '新しいユーザーを登録する' do
    visit new_user_path
    expect do
      fill_in 'Name', with: 'jiro'
      fill_in 'Age', with: '22'
      click_button 'Create User'

      expect(page).to have_content 'User was successfully created.'
      expect(page).to have_content 'Name: jiro'
      expect(page).to have_content 'Age: 22'
    end.to change { User.count }.by(1)
  end

  scenario 'ユーザーを編集する' do
    user = FactoryBot.create(:user, name: 'yamada', age: 40)

    visit user_path(user)
    expect(page).to have_content 'Name: yamada'
    expect(page).to have_content 'Age: 40'

    visit edit_user_path(user)
    fill_in 'Name', with: 'iwaki'
    fill_in 'Age', with: '38'
    click_button 'Update User'

    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Name: iwaki'
    expect(page).to have_content 'Age: 38'
  end

  scenario 'ユーザーを削除する' do
    user = FactoryBot.create(:user)

    expect do
      visit user_path(user)
      click_button 'Destroy this user'
      expect(page).to have_content 'User was successfully destroyed.'
      expect(page).to have_element('h1', text: 'Users')
    end.to change { User.count }.by(-1)
  end
end
