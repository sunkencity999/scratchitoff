class ListingListsTest < ActionDispatch::IntegrationTest

  setup { host! 'api.example.com'}

  test 'returns a list of lists' do 
    get '/lists'
    assert_equal 200, response.status
    refute_empty response.body
  end

end