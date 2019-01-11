require 'rails_helper'
feature 'User search recipe' do
  scenario 'user find only searched recipes' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    marmelada = Recipe.create(title: 'Marmelada', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'fácil',
                           cook_time: 10,
                           ingredients: 'Marmelo',
                           cook_method: 'Cozinhe o marmelo no fogo')
   goiabada = Recipe.create(title: 'Goiabada', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'médio',
                          cook_time: 20,
                          ingredients: 'Goiaba',
                          cook_method: 'Cozinhe a goiaba no fogo')

  visit root_path
  fill_in 'Procurar', with: marmelada.title
  click_on 'Buscar'

  expect(page).to have_css('h1', text:marmelada.title)
  expect(page).to have_css('li', text:marmelada.cook_time)
  expect(page).to have_css('li', text:marmelada.difficulty)
  expect(page).not_to have_css('h1', text:goiabada.title)
  end


end
