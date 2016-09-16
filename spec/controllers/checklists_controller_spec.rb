require 'spec_helper'


describe ChecklistsController, type: :controller do

  context 'when authenticated' do
    before(:each) do
      User.destroy_all
      user = create(:user)
      session[:session_token] = user.session_token
    end

    after(:each) do
      User.destroy_all
    end

    context 'GET #new' do
      it 'renders the new page' do
        get :new
        expect(response).to render_template('new')
        expect(response).to have_http_status(200)
      end
    end

    context 'GET #show' do
    end

    context 'GET #edit' do
      let!(:a_checklist) { create(:checklist) }

      it 'renders the new page' do
        get :edit, id: a_checklist.id
        expect(response).to render_template('edit')
        expect(response).to have_http_status(200)
      end
    end

    context 'POST #create' do
    end

    context 'POST #update' do
    end

    context 'POST #destroy' do
    end

    context 'GET #my_checklists' do
    end

    context 'GET #edit' do
    end
  end

end