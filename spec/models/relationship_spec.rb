require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user) { create(:user) }
  let(:relationship) { create(:relationship, user: user) }

  describe 'フォロー・フォロワー機能' do
    context "保存できる場合" do
      it "全てのパラメーターが揃っていれば保存できる" do
        expect(relationship).to be_valid
      end
    end

    context "保存できない場合" do
      it "follower_idがnilの場合は保存できない" do
        relationship.follower_id = nil
        relationship.valid?
        expect(relationship).to be_invalid
      end

      it "followed_idがnilの場合は保存できない" do
        relationship.followed_id = nil
        relationship.valid?
        expect(relationship).to be_invalid
      end
    end
  end
end
