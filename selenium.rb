require "selenium-webdriver" 
 
# defining a data structure to store the scraped data 
PokemonProduct = Struct.new(:url, :image, :name, :price) 
 
# initializing the list of objects 
# that will contain the scraped data 
pokemon_products = [] 
 
# configuring Chrome to run in headless mode 
options = Selenium::WebDriver::Chrome::Options.new 
options.add_argument("--headless") 
 
# initializing the Selenium Web Driver for Chrome 
driver = Selenium::WebDriver.for :chrome, options: options 
 
# visiting a web page in the browser opened 
# by Selenium behind the scene 
driver.navigate.to "https://scrapeme.live/shop/" 
 
# selecting all HTML product elements 
html_products = driver.find_elements(:css, "li.product") 
 
# iterating over the list of HTML products 
html_products.each do |html_product| 
	# extracting the data of interest 
	# from the current product HTML element 
	url = html_product.find_element(:css, "a").attribute("href") 
	image = html_product.find_element(:css, "img").attribute("src") 
	name = html_product.find_element(:css, "h2").text 
	price = html_product.find_element(:css, "span").text 
 
	# storing the scraped data in a PokemonProduct object 
	pokemon_product = PokemonProduct.new(url, image, name, price) 
 
	# adding the PokemonProduct to the list of scraped objects 
	pokemon_products.push(pokemon_product) 
end 
 
# closing the driver 
driver.quit 
 
# exporting logic

# selecting a pagination element 
pagination_element = driver.find_element(:css, "a.page-numbers") 
 
# visiting to a new page 
# directy in the browser 
paginationElement.click 
 
# waiting for the web page to load... 
 
puts driver$title # prints "Products – Page 2 – ScrapeMe"
