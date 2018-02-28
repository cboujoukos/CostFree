require 'rails_helper'

RSpec.describe Activity, :type => :model do

  let(:activity) {
    Activity.create!(
      :title => "Test Activity",
      :description => "Test Description"
    )
  }

  let(:titleless_activity) {
    Activity.create(
      :title => "",
      :description => "Dummy description"
    )
  }

  let(:descriptionless_activity) {
    Activity.create(
      :title => "Dummy title",
      :description => ""
    )
  }

  let(:category_1) {
    Category.create!(
      :title => "Test Category 1"
    )
  }

  let(:category_2) {
    Category.create!(
      :title => "Test Category 2"
    )
  }

  it "is invalid without a title" do
    expect(titleless_activity).not_to be_valid
  end

  it "is invalid with a description" do
    expect(descriptionless_activity).not_to be_valid
  end

  it "is valid with a title and a description" do
    expect(activity).to be_valid
  end

  it "has many categories" do
    activity.categories << category_1
    activity.categories << category_2
    expect(activity.categories).to include category_1
    expect(activity.categories).to include category_2
  end
end
