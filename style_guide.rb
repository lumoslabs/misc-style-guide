# GENERAL APP STYLE
#===================
# 1. Use 2 space for indentations

# 2. No spaces after (, [ and before ], ).
# good:
   set_layout_option(:analytics_page_prefix, 'bw')
   a = [1,2,3]
# bad:
   set_layout_option( :analytics_page_prefix, 'bw' )
   a = [ 1,2, 3]

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

# XXX. maximum characters per line
#   good:
    # need to decide

# TESTING STYLE
#==============
# 1. test setups
  # good:
    context 'user does have an ab test assignment for ab test' do
      setup do
        @abta = AbTestAssignment.create!(:user => @user, :ab_test_option => @abto_control)
      end

  # bad:
    context 'user does have an ab test assignment for ab test' do
      setup { @abta = AbTestAssignment.create!(:user => @user, :ab_test_option => @abto_control) }

    context 'user does have an ab test assignment for ab test' do
      setup {@abta = AbTestAssignment.create!(:user => @user, :ab_test_option => @abto_control)}

    context 'user does have an ab test assignment for ab test' do
      setup{ @abta = AbTestAssignment.create!(:user => @user, :ab_test_option => @abto_control) }

# 2. have empty line between contexts
  # good:
    context '#wombat' do
      ...
    end

    context '#snake' do
      ...
    end

  # bad:
    context '#wombat' do
      ...
    end
    context '#snake' do
      ...
    end

# 3. context without setup - no following empty line
  # good:
    context '#wombat' do
      should 'something' do
        assert true
      end
    end

  # bad:
    context '#wombat' do

      should 'something' do
        assert true
      end
    end

# 4. don't use parens, do use multi-line blocks for should argument:
  # good:
    should "have a completed training session" do
      assert @session.program_completed?
    end

  # bad:
    should("have a completed training session") do
      assert @session.program_completed?
    end

    should("have a completed training session"){assert @session.program_completed?}


# 5. spacing for setup and multiple shoulds in test:
  # good:
    context 'after completion of one session' do
      setup do
        @session.complete!
      end

      should "have a completed training session" do
        assert @session.program_completed?
      end

      should 'have one less incomplete_training_program than training_programs' do
        assert_equal @cp.training_programs.size - 1, @cp.incomplete_training_programs.size
      end

      context 'and some other thing' do
      end
    end

    context 'after other thing to do' do
    end

# 6. take advantage of shoulda - contexts and shoulda blocks should read like english
  # good:
    context 'a visitor' do
      context 'going to the home page' do
        should 'see the mini brain profile' do

    context '#show'
      context 'for a visitor' do
        context 'going to the home page' do
          should 'see the mini brain profile' do
  # bad:
    context 'visitor' do
      context 'home page' do
        should 'see the mini brain profile' do