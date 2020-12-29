describe Admin::ApplicationPolicy do
  subject { described_class }

  permissions :update?, :index?, :show?, :create?, :new?, :edit?, :destroy? do
    context 'when is an admin user' do
      let(:admin) { build(:admin_user) }

      it 'allows access' do
        expect(subject).to permit(admin, admin)
      end
    end
  end

  describe 'scope' do
    let(:admin) { create(:admin_user) }
    let(:mock_model) { double('MockModel', all: true) }
    subject { ApplicationPolicy::Scope.new(admin, mock_model).resolve }

    it 'shows all models' do
      expect(subject).to be(true)
    end
  end
end
