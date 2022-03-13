# Access your application domain as if you were in a rails console.
# There are three ways to run code in the console:

# 1 - Select all the code from line 5 to 11 and press cmd+Enter
module HelloWorld
  module_function

  def hello
    "Hello, World!"
  end
end

# 2 - Put your cursor on line 14 (no selection) and press cmd+Enter
HelloWorld.hello

# 3 - Type "HelloWorld.hello" in the terminal box below and press cmd+Enter
