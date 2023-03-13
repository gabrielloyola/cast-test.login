require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let!(:user) { create(:user) }
  let(:login_params) do
    {
      session: {
        username: user.username,
        password: user.password
      }
    }
  end

  describe "#login" do
    # Success
    context 'with correct username and password' do
      it 'log in successfully' do
        post '/login', params: login_params

        assert_equal session['user_id'], user.id
        assert_equal session['flash']['flashes']['notice'], 'Logado com sucesso.'
        expect(response).to redirect_to(cast_path)
      end
    end

    # Failures
    shared_examples 'with incorrect username or password' do
      it 'log in successfully' do
        post '/login', params: login_params

        assert_nil session['user_id']
        assert_equal session['flash']['flashes']['alert'], 'Usuário e/ou senha incorretos. Tente novamente.'
        expect(response).not_to redirect_to(cast_path)
      end
    end

    context 'with inexistent user' do
      let(:login_params) do
        {
          session: {
            username: 'Fulano',
            password: user.password
          }
        }
      end

      it_behaves_like 'with incorrect username or password'
    end

    context 'with inexistent user' do
      let(:login_params) do
        {
          session: {
            username: user.username,
            password: 'abcdefgh'
          }
        }
      end

      it_behaves_like 'with incorrect username or password'
    end
  end

  describe "#logout" do
    context 'when the user is logging out' do
      before do
        post '/login', params: login_params
      end

      it 'should log out the user and clear the session' do
        post '/logout'

        assert_nil session['user_id'], nil
        assert_equal session['flash']['flashes']['notice'], 'Deslogado com sucesso.'
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
