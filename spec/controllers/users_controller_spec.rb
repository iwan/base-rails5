require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) {
    { first_name: "Mario", last_name: "Rossi", email: "mario@example.com"}
  }

  let(:invalid_attributes) {
    { first_name: "Mario", last_name: "Rossi", email: "nope"}
  }

  let(:valid_session) { {} }

  context 'User logged' do
    login_user

    describe "GET #show" do
      it "assigns the requested user as @user" do
        user = subject.current_user
        get :show, params: {id: user.id}, session: valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "redirect because you are not allowed to show detail of another user" do
        user = create :user
        get :show, params: {id: user.id}, session: valid_session
        expect(assigns(:user)).to redirect_to('/access_denied')
      end
    end

    describe "GET #index" do
      it "not admin users cannot get users list" do
        c_user = subject.current_user
        get :index, params: {}, session: valid_session
        expect(response).to redirect_to('/access_denied')
      end

      it "assigns all users as @users if logged user is admin" do
        c_user = subject.current_user
        c_user.admin!
        user = create :user
        get :index, params: {}, session: valid_session
        expect(assigns(:users)).to eq([c_user, user])
      end

    end


    describe "GET #new" do
      it "assigns a new user as @user" do
        get :new, params: {}, session: valid_session
        expect(assigns(:user)).to be_a_new(User)
      end
    end


    describe "GET #edit" do
      it "assigns the requested user as @user" do
        c_user = subject.current_user
        get :edit, params: {id: c_user.to_param}, session: valid_session
        expect(assigns(:user)).to eq(c_user)
      end

      it "redirect when edit another user" do
        user = create :user
        get :edit, params: {id: user.to_param}, session: valid_session
        expect(response).to redirect_to('/access_denied')
      end
    end



    describe "POST #create" do
      context "admin user" do
        context "with valid params" do
          it "creates a new User" do
            subject.current_user.admin!
            expect {
              post :create, params: {user: attributes_for(:user)}, session: valid_session
            }.to change(User, :count).by(1)
          end

          it "assigns a newly created user as @user" do
            subject.current_user.admin!
            post :create, params: {user: attributes_for(:user)}, session: valid_session
            expect(assigns(:user)).to be_a(User)
            expect(assigns(:user)).to be_persisted
          end

          it "redirects to the created user" do
            subject.current_user.admin!
            post :create, params: {user: attributes_for(:user)}, session: valid_session
            expect(response).to redirect_to(User.last)
          end
        end

        context "with invalid params" do
          it "assigns a newly created but unsaved user as @user" do
            subject.current_user.admin!
            post :create, params: {user: invalid_attributes}, session: valid_session
            expect(assigns(:user)).to be_a_new(User)
          end

          it "re-renders the 'new' template" do
            subject.current_user.admin!
            post :create, params: {user: invalid_attributes}, session: valid_session
            expect(response).to render_template("new")
          end
        end
      end

      context "standard user" do
        context "with valid params" do
          it "cannot creates a new User" do
            expect {
              post :create, params: {user: attributes_for(:user)}, session: valid_session
            }.to change(User, :count).by(0)
          end

          it "redirects to access denied page" do
            post :create, params: {user: attributes_for(:user)}, session: valid_session
            expect(response).to redirect_to('/access_denied')
          end
        end
      end
    end



    describe "PUT #update" do
      context "your profile" do

        context "with valid params" do
          let(:new_attributes) {
            { email: "mario@example.com", first_name: "Mario" }
          }

          it "updates the requested user" do
            user = subject.current_user
            put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
            user.reload
            expect(user.email).to eq(new_attributes[:email])
            expect(user.first_name).to eq(new_attributes[:first_name])
          end

          it "assigns the requested user as @user" do
            user = subject.current_user
            put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
            expect(assigns(:user)).to eq(user)
          end

          it "redirects to the user" do
            user = subject.current_user
            put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
            expect(response).to redirect_to(dashboard_path)
          end
        end

        context "with invalid params" do
          it "assigns the user as @user" do
            user = subject.current_user
            put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
            expect(assigns(:user)).to eq(user)
          end

          it "re-renders the 'edit' template" do
            user = subject.current_user
            put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
            expect(response).to render_template("edit")
          end
        end
      end

      context "profile of another user" do

        context "with valid params" do
          let(:new_attributes) {
            { email: "mario@example.com", first_name: "Mario" }
          }

          it "redirects to access denied page" do
            user = create :user
            put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
            expect(response).to redirect_to('/access_denied')
          end
        end
      end

    end

    describe "DELETE #destroy" do
      it "destroys the current user" do
        user = subject.current_user
        expect {
          delete :destroy, params: {id: user.to_param, user: { email: user.email }}, session: valid_session
        }.to change(User, :count).by(-1)
      end

      it "will not destroys if email is not provided" do
        user = subject.current_user
        expect {
          delete :destroy, params: {id: user.to_param}, session: valid_session
        }.to change(User, :count).by(0)
      end


      it "redirects to the home page" do
        user = subject.current_user
        delete :destroy, params: {id: user.to_param, user: { email: user.email }}, session: valid_session
        expect(response).to redirect_to(home_url)
      end
    end

  end
  




  context 'User not logged' do

    describe "GET #show" do
      it "redirect to login form" do
        user = create :user
        get :show, params: {id: user.id}, session: valid_session
        expect(response).to redirect_to('/accounts/sign_in')
      end
    end

    describe "GET #index" do
      it "redirect to login form" do
        get :index, params: {}, session: valid_session
        expect(response).to redirect_to('/accounts/sign_in')
      end
    end


    describe "GET #new" do
      it "redirect to login form" do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to('/accounts/sign_in')
      end
    end

    describe "GET #edit" do
      it "redirect to login form" do
        user = create :user
        get :edit, params: {id: user.to_param}, session: valid_session
        expect(response).to redirect_to('/accounts/sign_in')
      end
    end
        
    describe "POST #create" do
      it "redirect to login form" do
        post :create, params: {user: attributes_for(:user)}, session: valid_session
        expect(response).to redirect_to('/accounts/sign_in')
      end
    end

    describe "PUT #update" do
      it "redirect to login form" do
        user = create :user        
        put :update, params: {id: user.to_param, user: { first_name: "ABC"}}, session: valid_session
        expect(response).to redirect_to('/accounts/sign_in')
      end
    end

    describe "DELETE #destroy" do
      it "redirect to login form" do
        user = create :user
        delete :destroy, params: {id: user.to_param}, session: valid_session    
        expect(response).to redirect_to('/accounts/sign_in')
      end
    end
  end
end
