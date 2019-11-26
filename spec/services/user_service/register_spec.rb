# frozen_string_literal: true

require 'rails_helper'

describe UserService::Register, type: :service do
  describe '#call' do
    subject { described_class.new(email: email, password: password).call }

    let(:email) { FFaker::Internet.email }
    let(:password) { FFaker::Internet.password }

    let(:success) { subject.success }
    let(:failure) { subject.failure }

    it { is_expected.to be_success }

    it 'creates new user' do
      expect { subject }.to change { User.count }.by(1)
    end

    it 'returns newly created user', :aggregate_failures do
      expect(success[:user]).to eq(User.last)
      expect(success[:user].email).to eq(email)
    end

    context 'when user is invalid' do
      before do
        allow_any_instance_of(User)
          .to receive(:save)
          .and_return(false)
        allow_any_instance_of(User)
          .to receive(:errors)
          .and_return(errors_double)
      end

      let(:errors_double) do
        instance_double(ActiveModel::Errors, full_messages: stubbed_full_messages)
      end

      let(:stubbed_full_messages) { ['error1', 'error2'] }

      it { is_expected.to be_failure }

      it 'does not create any user' do
        expect { subject }.to_not change { User.count }
      end

      it 'returns validation errors full messages' do
        expect(failure[:errors]).to eq(stubbed_full_messages)
      end
    end
  end
end