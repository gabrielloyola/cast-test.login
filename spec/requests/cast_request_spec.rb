require 'rails_helper'

RSpec.describe "Casts", type: :request do
  let!(:user) { create(:user) }

  describe '#index' do
    context 'when user is logged' do
      before { session['user_id'] = user.id }

      it 'should render the page' do
        get '/cast'

        expect(response).to be_successful
      end
    end

    context 'when user is not logged' do
      before { session['user_id'] = nil }

      it 'should render the page' do
        get '/cast'

        expect(response).to redirect_to(login_path)
        assert_equal session['flash']['flashes']['alert'], 'Usuário não logado.'
      end
    end
  end
end
