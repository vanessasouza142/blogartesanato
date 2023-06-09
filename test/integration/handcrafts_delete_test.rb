require "test_helper"

class HandcraftsDeleteTest < ActionDispatch::IntegrationTest
    def setup
        @artisan = Artisan.create!(name: "Vanessa", email: "vanessa@example.com", password: "password", password_confirmation: "password")
        @handcraft = Handcraft.create(name: "Painting", description: "Great handwork paintings with hot colors", artisan: @artisan)
      end

    test "successfully delete a handcraft" do
        sign_in_as(@artisan, "password")
        get handcraft_path(@handcraft)
        assert_template 'handcrafts/show'
        assert_select 'a[href=?]', handcraft_path(@handcraft), text: "Delete este artesanato"
        assert_difference 'Handcraft.count', -1 do
            delete handcraft_path(@handcraft)
        end
        assert_redirected_to handcrafts_path
        assert_not flash.empty?
    end



end
