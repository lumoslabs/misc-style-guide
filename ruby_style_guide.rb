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
  # a) when arg provided, put a space after the iterator, after the opening "{", and after the closing "}"
  # good:
      Product.family_plan.each { |p| puts p.name }
  # bad:
      Product.family_plan.each{ |p| puts p.name }
      Product.family_plan.each {|p| puts p.name}
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

# 4. Omit parentheses around parameters for methods that are part of an internal DSL (e.g. Rake, Rails, RSpec), methods that
#   are with "keyword" status in Ruby (e.g. attr_reader, puts) and attribute access methods. Use parentheses around the arguments
#   of all other method invocations.
#   Happily borrowing this phrasing from: https://github.com/bbatsov/ruby-style-guide#syntax

  # good:
    some_method('wombat', nil, :some_sym)
    has_many :users
  # bad:
    some_method 'wombat', nil, :some_sym
    some_method :thing
    some_method 'string'
    has_many(:users)

# 5. Use do..end for multi-line blocks, not {..}
  # good:
    Product.each do |p|
      pp p.name
      pp p.id
    end
  # bad:
    Product.each { |p|
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

# 12. Don't use parentheses for a conditional, unless the conditional contains an assignment.
  # good:
  if thing
  if (thing = some_method)

  # bad:
  if (thing)
  if thing = some_method

# 13. use single quotes when you don't need to do string interpolation
  # good
  s = 'hey wombat number 55'
  s = "hey #{@wombat.name}"

  # bad
  s = "hey wombat number 55"

# 14. Don't use brackets in arguments when they are not necessary.
  # good
  h.merge!(:thing => :good)

  # bad
  h.merg!({:thing => :bad})

# 15. You may but do not have to use class << self; def method in lieu of def self.method for groups of >= 5 class methods
  # good
  class ClassName
    def self.first_method; end

    def self.second_method; end
  end

  class ClassName
    class << self
      def first_method; end
      def second_method; end
      def third_method; end
      def fourth_method; end
      def fifth_method; end
    end
  end

  # bad
  class ClassName
    class << self
      def first_method; end

      def second_method; end
    end
  end

# 16. Always omit explicit object references when implicit ones suffice, excepting inheritance needs
  # good
  class ClassName
    attr_accessor :attrib

    def self.some_method
      other_method
      new.instance_method
    end

    def self.other_method
      some_method
    end

    def instance_method
      self.attrib = 5 # implicit does not suffice here
      self.class.other_method # class.other_method raises a syntax error
    end
  end

  # bad
  class ClassName
    attr_accessor :attrib

    def ClassName.some_method
      ClassName.other_method
      self.new.instance_method
    end

    def ClassName.other_method
      self.some_method # better than ClassName.some_method but still unecessary
    end

    def instance_method
      ClassName.other_method
    end
  end

# 17. Do not split classes/modules across multiple files, split them across multiple modules/classes in their own files.
# Do not split into multiple modules for the sole purpose of splitting into multiple files, it should be to aid testing or to share code.
  # good
  # file class_name.rb
  class ClassName
    def some_method; end
    def other_method; end
  end
  # end file

  # file other_class.rb
  class OtherClass
    include ComplexLogic

    def initialize # it's implied that this makes testing additional behavior difficult
      annoying_behavior && more_annoying_stuff
    end

    def annoying_behavior; end
    def more_annoying_stuff; end
  end
  # end file

  # file complex_logic.rb
  module ComplexLogic
    def complex_method; end
  end
  # end file

  # file complex_logic_spec.rb
  class TestClass
    include ComplexLogic
  end

  describe TestClass
    let(:instance){ TestClass.new }

    it "should do complex stuff" do
      instance.complex_method.should == "complex stuff"
    end
  end
  # end file

  # bad
  # file class_name.rb
  class ClassName
    include SomeMethods

    def other_method; end
  end
  # end file

  # file some_methods.rb
  module SomeMethods
    def some_method; end #implies trivial methods with no complexities justifying breaking out for testing purposes
  end
  # end file

  # file class_name_spec.rb
  describe ClassName do
    describe "#some_method" do
      it "does stuff" {} # if you're not even going to break out the spec then you shouldn't be breaking out into a module
    end
  end
  # end file

# XXX. maximum characters per line
#   good:
    # need to decide