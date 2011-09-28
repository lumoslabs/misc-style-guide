# 1. Use 2 space for indentations

# 2. No spaces after (, [ and before ], ).
# good:
   set_layout_option(:analytics_page_prefix, 'bw')
   a = [1,2,3]
# bad:
   set_layout_option( :analytics_page_prefix, 'bw' )
   a = [ 1,2, 3]
   a = [1, 2,3]
   a = [1,2 ,3]

# 3. blocks/closures
  # a) when arg provided, put a space after the iterator, not after the "{", and not before the "}"
  # good:
      Product.family_plan.each {|p| puts p.name}
  # bad:
      Product.family_plan.each{|p| puts p.name}
      Product.family_plan.each { |p| puts p.name }
      Product.family_plan.each {|p| puts p.name }

  # b) when no arg provided, blocks get a space before and after opening "{" and a space before closing "}"
  # good:
    silence_warnings { CONSTANT = 50 }
    h["Create Date"] = Proc.new { user.created_at.to_date ? format_datetime_for_targeting(user.created_at.to_date) : nil }
  # bad:
    setup {set_request_to_ssl}
    setup{ set_request_to_ssl }
    h["Create Date"] = Proc.new{ user.created_at.to_date ? format_datetime_for_targeting(user.created_at.to_date) : nil }
    h["Create Date"] = Proc.new {user.created_at.to_date ? format_datetime_for_targeting(user.created_at.to_date) : nil}

# 4. use parentheses when there are arguments
  # def some_method(a, b, c); end

  # good:
    some_method('wombat', nil, :some_sym)
  # bad:
    some_method 'wombat', nil, :some_sym

  # exceptions: when only one arg and its a String or Symbol
  # good:
    some_method :thing
    some_method 'string'
    assert_response :success
  # bad:
    some_method User.first
    some_method var

# 5. Use do..end for multi-line blocks, not {..}
  # good:
    Product.each do |p|
      pp p.name
      pp p.id
    end
  # bad:
    Product.each do {|p|
      pp p.name
      pp p.id
    }

# 6. use spaces when having default value for arg in method definition
  # good:
    some_method(a, b, options = {})
  # bad:
    some_method(a, b, options={})

# 7. multi-line hash initialization - first [key,value] pair is on a newline, ending "}" goes on a new line
  # good:
    h = {
      :site               => "http://foursquare.com",
      :scheme             => :header,
      :http_method        => :post,
      :request_token_path => "/oauth/request_token",
      :access_token_path  => "/oauth/access_token",
      :authorize_path     => "/oauth/authorize",
      :proxy              => (ENV['HTTP_PROXY'] || ENV['http_proxy'])
    }

  # bad:
    h = {
      :site               => "http://foursquare.com",
      :scheme             => :header,
      :http_method        => :post,
      :request_token_path => "/oauth/request_token",
      :access_token_path  => "/oauth/access_token",
      :authorize_path     => "/oauth/authorize",
      :proxy              => (ENV['HTTP_PROXY'] || ENV['http_proxy'])}

    h = {:site               => "http://foursquare.com",
      :scheme             => :header,
      :http_method        => :post,
      :request_token_path => "/oauth/request_token",
      :access_token_path  => "/oauth/access_token",
      :authorize_path     => "/oauth/authorize",
      :proxy              => (ENV['HTTP_PROXY'] || ENV['http_proxy'])
    }

  # don't end with trailing comma:
    h = {
      :site               => "http://foursquare.com",
      :scheme             => :header,
      :http_method        => :post,
      :request_token_path => "/oauth/request_token",
      :access_token_path  => "/oauth/access_token",
      :authorize_path     => "/oauth/authorize",
      :proxy              => (ENV['HTTP_PROXY'] || ENV['http_proxy']),
    }

# 8. use a url helper when doing things like redirect_to in controller
  # good:
    redirect_to root_url
  # bad:
    redirect_to :action => :index

# 9. use a symbol when doing things like render in controller
  # good:
    render :show
  # bad:
    render 'show'

# 10. calling method with arguments that runs multi-line.
  # good:
    options = {
      :some               => :hash,
      :site               => "http://foursquare.com",
      :scheme             => :header,
      :http_method        => :post,
      :request_token_path => "/oauth/request_token",
      :access_token_path  => "/oauth/access_token",
      :authorize_path     => "/oauth/authorize",
      :proxy              => (ENV['HTTP_PROXY'] || ENV['http_proxy'])
    }
    @consumer = ::OAuth::Consumer.new(@consumer_token, @consumer_secret, another_arg, options)

  # bad:
    @consumer = ::OAuth::Consumer.new(@consumer_token, @consumer_secret,
      another_arg, {:some => :hash,
      :site               => "http://foursquare.com",
      :scheme             => :header,
      :http_method        => :post,
      :request_token_path => "/oauth/request_token",
      :access_token_path  => "/oauth/access_token",
      :authorize_path     => "/oauth/authorize",
      :proxy              => (ENV['HTTP_PROXY'] || ENV['http_proxy'])
    })

# 11. variable assignment - use a space
  # good:
  wombat = 55

  # bad:
  wombat=55

# 12. put a space before parens in if clause
  # good:
  if (thing)

  # bad:
  if(thing)

# 13. use single quotes when you don't need to do string interpolation
  # good
  s = 'hey wombat number 55'
  s = "hey #{@wombat.name}"

  # bad
  s = "hey wombat number 55"

# XXX. maximum characters per line
#   good:
    # need to decide