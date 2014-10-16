require 'test_helper'

class PokemonsetsControllerTest < ActionController::TestCase
  setup do
    @pokemonset = pokemonsets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pokemonsets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pokemonset" do
    assert_difference('Pokemonset.count') do
      post :create, pokemonset: { ability: @pokemonset.ability, atk1: @pokemonset.atk1, atk2: @pokemonset.atk2, atk3: @pokemonset.atk3, atk4: @pokemonset.atk4, atk: @pokemonset.atk, comment: @pokemonset.comment, def: @pokemonset.def, hp: @pokemonset.hp, item: @pokemonset.item, nature: @pokemonset.nature, spatk: @pokemonset.spatk, spd: @pokemonset.spd, spdef: @pokemonset.spdef, specie: @pokemonset.specie }
    end

    assert_redirected_to pokemonset_path(assigns(:pokemonset))
  end

  test "should show pokemonset" do
    get :show, id: @pokemonset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pokemonset
    assert_response :success
  end

  test "should update pokemonset" do
    patch :update, id: @pokemonset, pokemonset: { ability: @pokemonset.ability, atk1: @pokemonset.atk1, atk2: @pokemonset.atk2, atk3: @pokemonset.atk3, atk4: @pokemonset.atk4, atk: @pokemonset.atk, comment: @pokemonset.comment, def: @pokemonset.def, hp: @pokemonset.hp, item: @pokemonset.item, nature: @pokemonset.nature, spatk: @pokemonset.spatk, spd: @pokemonset.spd, spdef: @pokemonset.spdef, specie: @pokemonset.specie }
    assert_redirected_to pokemonset_path(assigns(:pokemonset))
  end

  test "should destroy pokemonset" do
    assert_difference('Pokemonset.count', -1) do
      delete :destroy, id: @pokemonset
    end

    assert_redirected_to pokemonsets_path
  end
end
