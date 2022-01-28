require 'rails_helper'

RSpec.describe ArmsController do
  let(:clinic) { create(:clinic) }
  
  describe '#index' do
    it 'returns 200' do
      get :index, params: { clinic_id: clinic.id }

      expect(response.status).to eq 200
    end
  end

  describe '#new' do
    it 'returns new arm' do
      get :new, params: { clinic_id: clinic.id }

      expect(assigns(:arm)).to be_a_new(Arm)
    end
  end

  describe '#edit' do
    context 'when arm does not exist' do
      it 'returns nil' do
        get :edit, params: { clinic_id: clinic.id, id: 5 }

        expect(assigns(:arm)).to eq(nil)
      end
    end


    context 'when arm exist' do
      let!(:arm) { create(:arm, clinic: clinic) }
      it 'assigns an existing arm' do
        get :edit, params: { clinic_id: clinic.id, id: arm.id }

        expect(assigns(:arm)).to eq(arm)
      end
    end

  end

  describe '#create' do
    let(:params) {
      {
        arm: {
          name: Faker::Name.name,
          limit: Faker::Number.between(from: 5, to: 15)
        },
        clinic_id: clinic.id
      }
    }

    context 'when params are absent' do
      let(:params) {
        {
          arm: {},
          clinic_id: clinic.id
        }
      }
      it 'render new template' do
        post :create, params: params

        expect(response).to render_template(:new)
      end
    end

    context 'when params are present' do
      it 'create an arm' do
        post :create, params: params

        expect(Arm.count).to eq(1)
      end

      it 'redirect to index' do
        post :create, params: params

        expect(response).to redirect_to(clinic_arms_path(clinic.id))
      end
    end
  end

  describe '#update' do
    let(:arm) { create(:arm, clinic: clinic) }
    let(:params) {
      {
        id: arm.id,
        arm: {
          name: 'new_arm',
          limit: 15
        },
        clinic_id: clinic.id
      }
    }
    context 'when params are absent' do
      before { allow_any_instance_of(Arm).to receive(:update).and_return(false) }

      it 'renders edit' do
        put :update, params: params

        expect(response).to render_template(:edit)
      end
    end

    context 'when params are present' do

      it 'redirect to index' do
        put :update, params: params

        expect(response).to redirect_to(clinic_arms_path(clinic.id))
      end

      it 'update arm' do
        put :update, params: params

        expect(arm.reload.name).to eq('new_arm')
        expect(arm.reload.limit).to eq(15)
      end
    end
  end
end
