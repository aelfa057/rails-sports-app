require 'test_helper'

class UserTest < ActiveSupport::TestCase

    def setup
        @user = User.new(username: "test123", email: "test123@example.com", password: "password")
    end
    
    test "New User should be valid" do
        assert @user.valid?
    end
    
    test "User should be invalid, no password" do
        user2 = User.new(username: "test123", email: "test123@example.com")
        assert_not user2.valid?
    end
    
    test "User should be invalid, no username" do
        user2 = User.new(email: "test123@example.com", password: "password")
        assert_not user2.valid?
    end
    
    test "User should be invalid, no email" do
        user2 = User.new(username: "test123", password: "password")
        assert_not user2.valid?
    end
    
    test "Username should be unique" do
       @user.save
       user2 = User.new(username: "test123", email: "test12@example.com", password: "password")
       assert_not user2.valid?
    end
    
    test "Email should be unique" do
       @user.save
       user2 = User.new(username: "test123", email: "test123@example.com", password: "password")
       assert_not user2.valid?
    end
    
    test "Username should be present" do
        user2 = User.new(username: "    ", email: "test123@example.com", password: "password")
        assert_not user2.valid?
    end
    
    test "E-mail should be present" do
        user2 = User.new(username: "test123", email: "     ", password: "password")
        assert_not user2.valid?
    end
    
    test "Username should be more than 2 characters" do
        user2 = User.new(username: "tt", email: "test12@example.com", password: "password")
       assert_not user2.valid?
    end
    
    test "Username should be less than 25 characters" do
        user2 = User.new(username: "test12345678910111213141516", email: "test12@example.com", password: "password")
       assert_not user2.valid?
    end
    
    test "E-mail should have valid format" do
        user2 = User.new(username: "test123", email: "test123@example", password: "password")
       assert_not user2.valid?
       user3 = User.new(username: "test123", email: "test123example.com", password: "password")
       assert_not user3.valid?
    end
    
    test "E-mail should be unique and NOT case sensitive" do
        @user.save
        user2 = User.new(username: "test23", email: "test123@example.com", password: "password")
        user2.email = user2.email.upcase
        assert_not user2.valid?
    end
    
    test "E-mail should be saved as lowercase" do
       test_email = "TeSt12@ExAmPlE.CoM" 
       @user.email = test_email
       @user.save
       assert_equal test_email.downcase, @user.reload.email
    end
    
end