class ListingPostsTest < ActionDispatch::IntegrationTest

  setup { host! 'api.example.com'}

  test 'returns a list of posts' do 
    get '/posts'
    assert_equal 200, response.status
    refute_empty response.body
  end
end