describe ApplicationPolicy do
  subject { described_class }

  permissions :update?, :index?, :show?, :create?, :new?, :edit?, :destroy? do
    context 'when is an user' do
      let(:user) { build(:user) }

      it 'denies access' do
        expect(subject).not_to permit(user, user)
      end
    end
  end

  describe 'scope' do
    let(:user) { create(:user) }
    let(:mock_model) { double('MockModel', all: true) }
    subject { ApplicationPolicy::Scope.new(user, mock_model).resolve }

    it 'shows all models' do
      expect(subject).to be(true)
    end
  end
end
