require_relative '../lib/author'
RSpec.describe Author do
  # Positive test
  it "creates an author with valid name and email" do
    author = Author.new("Chicken", "chicken@gmail.com")
    expect(author.name).to eq("Chicken")
    expect(author.email).to eq("chicken@gmail.com")
  end

  # Negative tests
  it "raises an error if name is missing" do
    expect { Author.new(nil, "chicken@gmail.com") }.to raise_error(ArgumentError)
    expect { Author.new("", "chicken@gmail.com") }.to raise_error(ArgumentError)
  end

  it "raises an error if email is missing" do
    expect { Author.new("Chicken", nil) }.to raise_error(ArgumentError)
    expect { Author.new("Chicken", "") }.to raise_error(ArgumentError)
  end

  # Edge cases
  it "accepts extremely long names and emails" do
    long_name = "A" * 500
    long_email = ("B" * 100) + "@example.com"
    author = Author.new(long_name, long_email)
    expect(author.name).to eq(long_name)
    expect(author.email).to eq(long_email)
  end
end

