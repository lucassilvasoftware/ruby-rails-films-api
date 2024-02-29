RSpec.describe User, type: :model do
  it "authenticates user with valid credentials" do
    user = User.create(email: "example@example.com", password: "password")
    authenticated_user = User.authenticate_by(email: "example@example.com", password: "password")

    expect(authenticated_user).to eq(user)
  end
end
