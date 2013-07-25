require 'spec_helper'

describe MainController, :type => :controller do
  it 'add user' do
    get :index, {:api_url=>"http://api.vk.com/api.php",
                 :api_id=>"2142491",
                 :api_settings=>"287",
                 :viewer_id=>"5726946",
                 :viewer_type=>"2",
                 :sid=>"48820bf26388513f02251ee07f5cd5497ddce357615121c93947c398a25666b699031e31d3547c39a3e9c",
                 :secret=>"0bf382ee12",
                 :access_token=>"886b1536cd389d98766f705af7d102d1e30c5bfed3718e4ab56ce52ea51a02adb8d8682296f1f7f60740f",
                 :user_id=>"5726946",
                 :group_id=>"0",
                 :is_app_user=>"1",
                 :auth_key=>"6131eaf372fa800d0014f1d35077e784",
                 :language=>"0",
                 :parent_language=>"0",
                 :ad_info=>"ElsdCQRbQ1NtAQJNRARQBHR6FAsmMQxVUUZGNgBQbwYfQyQrWQA=",
                 :is_secure=>"0",
                 :api_result=>{
                     :response=>[
                         {:uid=>5726946,
                          :first_name=>"Антон",
                          :last_name=>"Городишенин",
                          :photo_rec=>"http:\\vk.com\images\camera_c.gif",
                          :university=>401282,
                          :university_name=>"МИЭТ",
                          :faculty=>0,
                          :faculty_name=>"",
                          :graduation=>0,
                          :schools=>[]}]}.to_json,
                 :referrer=>"menu",
                 :lc_name=>"c441c07b",
                 :hash=>""}
    User.find_by_n_vk_id(5726946).should_not be_nil
  end
end
