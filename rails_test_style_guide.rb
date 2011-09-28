#
# Test Structure
#

# Unit and functional tests should have specific methods of the class as the top level context, with the
# signature of "context '#<method_name>' do". This makes it easy to understand what methods are covered,
# and how well they are covered. So if we have:
class Wombat
  def charge
    ...
  end
end

# then our test file would be:
class WombatTest < ActiveSupport::TestCase
  context '#charge' do
    context 'for a small wombat' do
      ...
    end

    context 'for a large wombat' do
      ...
    end
  end
end

# and not:
class WombatTest < ActiveSupport::TestCase
  context 'for a small wombat' do
    ...
  end

  context 'for a large wombat' do
    ...
  end
end

# The method being tested should be in the setup of the 'context', not in the 'should' block.
# This lends towards making simiple, compact 'should' blocks that just test one specific thing.
# So we would have:
class WombatTest < ActiveSupport::TestCase
  context '#charge' do
    context 'for a small wombat' do
      setup do
        @wombat = Factory.create(:wombat, :size => :small)
        @wombat.charge
      end

      should 'fail'

      should 'not injure the human caretaker'
    end

    context 'for a large wombat' do
      setup do
        @wombat = Factory.create(:wombat, :size => :large)
        @wombat.charge
      end

      should 'succeed'

      should 'injure the human caretaker'
    end
  end
end


#
# Style
#

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