require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Tom baraka', username: 'tom', email: 'tom00@gmail.com', password: 'tom244',
             password_digest: 'tom244')
  end
  before { subject.save }
  it 'Name must not be blank' do
    subject.name = 'Tom baraka'
    expect(subject).to be_valid
  end

  it 'Email must not be blank' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'Password must not be blank' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'Password confirmation must not be blank' do
    subject.password_digest = nil
    expect(subject).to_not be_valid
  end

  it 'Password confirmation must not be blank' do
    subject.password_digest = nil
    expect(subject).to_not be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'asscociations' do
    it { should have_many(:rooms).through(:reservations) }
    it { should have_many(:hotels) }
    it { should have_many(:reservations) }
  end
end
