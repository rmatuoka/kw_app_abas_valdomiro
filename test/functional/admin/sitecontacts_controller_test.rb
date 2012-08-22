require 'test_helper'

class Admin::SitecontactsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Sitecontact.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Sitecontact.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Sitecontact.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_sitecontact_url(assigns(:sitecontact))
  end

  def test_edit
    get :edit, :id => Sitecontact.first
    assert_template 'edit'
  end

  def test_update_invalid
    Sitecontact.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Sitecontact.first
    assert_template 'edit'
  end

  def test_update_valid
    Sitecontact.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Sitecontact.first
    assert_redirected_to admin_sitecontact_url(assigns(:sitecontact))
  end

  def test_destroy
    sitecontact = Sitecontact.first
    delete :destroy, :id => sitecontact
    assert_redirected_to admin_sitecontacts_url
    assert !Sitecontact.exists?(sitecontact.id)
  end
end
