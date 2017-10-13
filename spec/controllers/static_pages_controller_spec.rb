require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  #loginユーザーの作成
  let(:user) { create(:user) }

  # homeのアクセス
  describe 'GET #home' do
    context 'ログインしている場合' do
      # アクセス・ログイン処理
      before do
        login_user user
        get :home
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it ':homeテンプレートを表示すること' do
        expect(response).to render_template :home
      end
    end
    context 'ログインしていない場合' do
      # アクセス
      before do
        get :home
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
