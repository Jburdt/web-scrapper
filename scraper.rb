require "httparty"
require "nokogiri"

# puts "Hello, World!"

# downloading the target webpage

response = HTTParty.get("https://scrapeme.live/shop/", {
  headers: {
    "User-agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36" 
  }
})

# parsing the HTML document returned by the server
document = Nokogiri::HTML(response.body)

# defining a data structure to store the scraped data
PokemonProduct = Struct.new(:url, :image, :name, :price)

# selecting all HTML product elements
html_products = document.css('li.product')

# intializing the list of objects that will contain the scrapped objects
pokemon_products = []

# iterating over the list of HTML products
html_products.each do |html_product|
  # extracting the data of interest from the current product HTML element 
end
	
