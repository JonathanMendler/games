require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/games.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Game.count, data.length
  end

  test "create" do
    assert_difference "Game.count", 1 do
      post "/games.json", params: { manufacturer: "Sega", console: "Dreamcast", price: 200, storage: "128KB (expandable)", description: "test", image_url: "test.jpg" }
      assert_response 200
    end
  end

  test "show" do
    get "/games/#{Game.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "manufacturer", "console", "price", "storage", "description", "image_url", "created_at", "updated_at"] data.keys
  end

  test "update" do
    game = Game.first
    patch "/games/#{Game.first.id}.json", params: { manufacturer: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Game.count", -1 do
      delete "/games/#{game.first.id}.json"
      assert_response 200
    end
  end
end
