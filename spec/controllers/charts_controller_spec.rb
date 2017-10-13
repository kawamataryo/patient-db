require 'rails_helper'

RSpec.describe ChartsController, type: :controller do
  #loginユーザーの作成
  let(:user) { create(:user) }

  # showのアクセス
  describe 'GET #show' do
    context 'ログインしている場合' do
      # アクセス・ログイン処理
      before do
        login_user user
        get :show
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it ':showテンプレートを表示すること' do
        expect(response).to render_template :show
      end
    end
    context 'ログインしていない場合' do
      # アクセス
      before do
        get :show
      end
      it 'リクエストは302 リダイレクトとなること' do
        expect(response.status).to eq 302
      end
      it 'loginページを表示すること' do
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

end
