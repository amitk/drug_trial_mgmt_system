# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor do
  describe '#validations' do
    context 'when name is absent' do
      it 'fails on creating doctor record' do
      end
    end

    context 'when name is present' do
      it 'creates doctor record' do
      end
    end
  end
end
